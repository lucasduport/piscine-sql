SELECT
    CAST((SELECT avg(COALESCE(NULLIF(rsa_time,0), (SELECT MAX(rsa_time)
                                    FROM dtf.madelines_files_results
                                    LIMIT 1)))) AS numeric(10,2))
AS avg_rsa_time,
    CAST((SELECT avg(COALESCE(NULLIF(hyper_pulse_time,0), (SELECT MAX(hyper_pulse_time)
                                    FROM dtf.madelines_files_results
                                    LIMIT 1)))) AS numeric(10,2))
AS avg_hyper_pulse_time,
    CAST((SELECT avg(COALESCE(NULLIF(quantum_x_time,0), (SELECT MAX(quantum_x_time)
                                    FROM dtf.madelines_files_results
                                    LIMIT 1)))) AS numeric(10,2))
AS avg_quantum_x_time,
    CAST((SELECT avg(COALESCE(NULLIF(aes_time,0), (SELECT MAX(aes_time)
                                    FROM dtf.madelines_files_results
                                    LIMIT 1)))) AS numeric(10,2))
AS avg_aes_time,
    CAST((SELECT avg(COALESCE(NULLIF(d_crypt_time,0), (SELECT MAX(d_crypt_time)
                                    FROM dtf.madelines_files_results
                                    LIMIT 1)))) AS numeric(10,2))
AS avg_d_crypt_time
FROM  dtf.madelines_files_results;
