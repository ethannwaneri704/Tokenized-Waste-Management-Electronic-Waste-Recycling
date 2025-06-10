;; Facility Verification Contract
;; Manages verification and registration of electronic waste recycling facilities

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_FACILITY_EXISTS (err u101))
(define-constant ERR_FACILITY_NOT_FOUND (err u102))
(define-constant ERR_INVALID_STATUS (err u103))

;; Facility status types
(define-constant STATUS_PENDING u0)
(define-constant STATUS_VERIFIED u1)
(define-constant STATUS_SUSPENDED u2)
(define-constant STATUS_REVOKED u3)

;; Data structure for facilities
(define-map facilities
  { facility-id: uint }
  {
    owner: principal,
    name: (string-ascii 100),
    location: (string-ascii 200),
    license-number: (string-ascii 50),
    status: uint,
    verification-date: uint,
    capacity: uint
  }
)

(define-map facility-counter principal uint)
(define-data-var next-facility-id uint u1)

;; Register a new recycling facility
(define-public (register-facility (name (string-ascii 100))
                                 (location (string-ascii 200))
                                 (license-number (string-ascii 50))
                                 (capacity uint))
  (let ((facility-id (var-get next-facility-id)))
    (asserts! (is-none (map-get? facilities { facility-id: facility-id })) ERR_FACILITY_EXISTS)
    (map-set facilities
      { facility-id: facility-id }
      {
        owner: tx-sender,
        name: name,
        location: location,
        license-number: license-number,
        status: STATUS_PENDING,
        verification-date: u0,
        capacity: capacity
      }
    )
    (var-set next-facility-id (+ facility-id u1))
    (ok facility-id)
  )
)

;; Verify a facility (only contract owner)
(define-public (verify-facility (facility-id uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (match (map-get? facilities { facility-id: facility-id })
      facility-data
      (begin
        (map-set facilities
          { facility-id: facility-id }
          (merge facility-data {
            status: STATUS_VERIFIED,
            verification-date: block-height
          })
        )
        (ok true)
      )
      ERR_FACILITY_NOT_FOUND
    )
  )
)

;; Get facility information
(define-read-only (get-facility (facility-id uint))
  (map-get? facilities { facility-id: facility-id })
)

;; Check if facility is verified
(define-read-only (is-facility-verified (facility-id uint))
  (match (map-get? facilities { facility-id: facility-id })
    facility-data (is-eq (get status facility-data) STATUS_VERIFIED)
    false
  )
)
