Return-Path: <linux-next+bounces-7825-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B56B18DE3
	for <lists+linux-next@lfdr.de>; Sat,  2 Aug 2025 12:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDA293B9678
	for <lists+linux-next@lfdr.de>; Sat,  2 Aug 2025 10:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B281EF38E;
	Sat,  2 Aug 2025 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PnDQmli3"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B2522083
	for <linux-next@vger.kernel.org>; Sat,  2 Aug 2025 10:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754129055; cv=none; b=X9XgDUcnoyK//ohL1O9cWuyvahlrqDYVy3vAyeGMryp+095Hvf57l3CwRTfl9Rijxr9SAsOk4izGiaG3W62o7W/WRKKVLh0A4+x9eqF7fsGwRBwJT18jVe7fk7ae/rmML7FP/cMR07NtuFKo+DUUv0GR1Elziqki5S1tJ8FH6vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754129055; c=relaxed/simple;
	bh=97gAxnh0fEMkcSwI4B4lfP7CM4ztyMA8z9xfL7ubip4=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=dxcs5SjnGiPHVCvZJypJ918uVl+o9/lUWkBj/hKrKQgE1rZ0kKvlxhVTaZZWMd9LuNcbXJAoWox3vtfoPMDKDvb0U6/5czAuIwNdIYTLsd0jyIPdARj7Pl8af0Qk1B/424VwhMnkO9JRL0D+pqoDVW6ExJHMyED+wiD7xgO2Dzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PnDQmli3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725f73P002475
	for <linux-next@vger.kernel.org>; Sat, 2 Aug 2025 10:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pUrhfkypASB9H8lKbshbus
	xBoT4k5NSrZrJajYeWNFo=; b=PnDQmli3LwNpRGOGd3NvuYgjDQrQgosnWqJ/hx
	M6m9Su44/kyiKTkSMWI4lqv91zceHOoYZXE3T/sdpFWarrcFCV31HomIgcYWhYl6
	E50TahhTUatqDxoIFfKaT0ETLXnWYuuVsfG3d2K2b5yE/b6Gh9i8yM+ymLDNROHb
	6mJy9yEZutDtCQXHlsH9tDiTmAutxarBR8Z1UW+1L6WIS7KEh+xBJi4Fq5JaNxnO
	FhfWeQJrZoARL6xo8Iv+fu+lfQy0hIY/bWYKjHGdQ5g9M6cYkEWsvQJhkSrlGHen
	+kkTOSbXBV1fSlgX8y7zRjEC1njoJ1vCHNxAUNW8lDlnFrrg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489aw70k3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Sat, 02 Aug 2025 10:04:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7074b13178eso2927966d6.0
        for <linux-next@vger.kernel.org>; Sat, 02 Aug 2025 03:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754129052; x=1754733852;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pUrhfkypASB9H8lKbshbusxBoT4k5NSrZrJajYeWNFo=;
        b=CcsnpyOkvORpxEcIC+9WIZLFSvLBSp7R+JIWCx03i5krnUV0R8UV9+EBmFxSCJvvlQ
         OLWUgnp34steoGNrmpoDsdmJaO8YimRoh7LKt/9hKBUFYOqMMmUsGDsfTPl/bENKh2iO
         NShz5+CwyxLOlOEgy9f6MAmA0wl090O0LEodSQJ1Bp4tDoal2N12LDmWtZ9rCfmdMVpI
         8aer6dtjnEOnEBc+NwvjPziDYziet9glgY1WceFLPr0NYggMFoykE2qHrVYk0zF9E2Vk
         hZY4Zpj3E+tzhSmGd/NRArF2uXoB86lM6sm/TmzRGy40B3VYBSErTyHICwC3eWi7fU53
         CCGw==
X-Gm-Message-State: AOJu0YyX6/nI4OxznYImIl9mlzaio05V0+STS1lwdYEc889y88OB22DS
	E2jk9sa5jucbKThHTJfTT7oI7/usfLZnWF/9IcJFpaX3KpRYFeEuq/cMIp9zjPHG8vNGqboasIB
	9Ld5nmuFmDkQWYDbKzqyWqNkcBeIHMZCMMs7EyyE1ZaYY7xlN4THmN9Yr0WRhBZaP
X-Gm-Gg: ASbGncuHVP/RlqCkwtBvEtr2KqqhvcqK2fl4kvXD/Q60LDLJMKcgFAcVmeuBdOUZf8N
	PRSVBvpHht04t1SMZS7wxOvhNh+ADk/VAGn23B/ERiC2n5eV8FX7C8lRTjLAHbnFDH/tzfdIB96
	HPeQLjCXsmDvdeD3LXZPYmUj3qTS9E30uxps/36J008gmeo5X+KQ09Q5GQDCG9IN+MwxWN1rm1v
	LghGaw6AbLS4wTiUv85IzsaUDaO93VQuLT/OgLWAoJXdIKOHMdePhJkVIY4Jt8NsIDgeXR/mM0q
	s3VtMBkyDXZ2emieRRIEJzerl3k6EbNbd2yCWGDdnCHSQzSivKC2asP4pk8GxAXhruTphVRWMdP
	F9R2A9SIUA5xFrThzcQ==
X-Received: by 2002:a05:622a:d0:b0:4ab:635b:a309 with SMTP id d75a77b69052e-4af107717c5mr22217551cf.0.1754129051710;
        Sat, 02 Aug 2025 03:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqqD5eyppq8LAAIBy/fBO2svh5Knc9MSxVl3Cia3qlBiWJudW4SR+015MJCk+gdRzxv8sYPw==
X-Received: by 2002:a05:622a:d0:b0:4ab:635b:a309 with SMTP id d75a77b69052e-4af107717c5mr22217341cf.0.1754129051173;
        Sat, 02 Aug 2025 03:04:11 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2a448sm4003043a12.20.2025.08.02.03.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Aug 2025 03:04:09 -0700 (PDT)
Message-ID: <b390beb2-441f-4a3d-b53d-3f554b308be2@oss.qualcomm.com>
Date: Sat, 2 Aug 2025 12:04:07 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kent Overstreet <kent.overstreet@linux.dev>
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Build failure on next-20250801
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-bcachefs@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WwF33FKWJAvg3NaH9ppKoTAUpTIPP3ep
X-Proofpoint-ORIG-GUID: WwF33FKWJAvg3NaH9ppKoTAUpTIPP3ep
X-Authority-Analysis: v=2.4 cv=MrZS63ae c=1 sm=1 tr=0 ts=688de29d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=ljw3QelReVnGxZt3u5EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA4MyBTYWx0ZWRfX/T0cuLiQ04T+
 XL2yW9XOn8W+y5ER/y70QbAoSl4tHqzLk/4CSHCYEjFtKbB5/AHYxzkbHONN7ISbZrlNFoPI4RB
 KYsypX/YQtBuk/DKxAZHi2YTw27ScDi8+4RlhJS7meaE/Emf7Kj9oqY9D348w0cweL4qeOl+GMn
 2uyA7cJ/QJywqb29drN0sjUoisTSxcgrfnHIvTC1mrJkomFaiVsSyo5uwEJFgAaKtJIXajj9jqg
 IReD+71EbSWgzvktA5IQkhAAQbz4BHSyIiTrhwvT1oFJe/w/NbKyXBX4Y9ZfmU1G++J44u/rqU/
 TwEQbcm1BPCQf+Dr9j/GUqYMP+AhEguz+gHrVK22YllPI+yO/Ki97Z+gHfy7LJ+yRVzq7wJmQa+
 R2W+ghVXEyTUnfg8UjbAmIzuHSrnSIDkw5piB18IevBY+/fRIDAJ7Rbfc3VYyoLWtm0qY2RX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020083

Hi, just hit the below on next-20250801

Reverting

4c3205637f1e ("bcachefs: CLASS(btree_iter)")
...
69c862491582 ("Revert "bcachefs: Convert bch2_bkey_get_mut() to
CLASS(btree_iter)"")

(mostly as dependencies for clean reverts)

gets it to build again.


In case that matters (which I believe it doesn't), I'm using clang
on x86, version 20.1.8


fs/bcachefs/backpointers.c:391:7: error: cannot jump from this goto statement to its label
  391 |                 if (fsck_err(trans, backpointer_to_missing_device,
      |                     ^
fs/bcachefs/error.h:140:2: note: expanded from macro 'fsck_err'
  140 |         __fsck_err(c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
      |         ^
fs/bcachefs/error.h:117:26: note: expanded from macro '__fsck_err'
  117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
      |                                 ^
fs/bcachefs/error.h:111:3: note: expanded from macro 'fsck_err_wrap'
  111 |                 goto fsck_err;                                          \
      |                 ^
fs/bcachefs/backpointers.c:398:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
  398 |         CLASS(btree_iter, alloc_iter)(trans, BTREE_ID_alloc, bucket, 0);
      |                           ^
1 error generated.
make[4]: *** [scripts/Makefile.build:287: fs/bcachefs/backpointers.o] Błąd 1
make[4]: *** Oczekiwanie na niezakończone zadania....
fs/bcachefs/alloc_background.c:2097:7: error: cannot jump from this goto statement to its label
 2097 |                 if (fsck_err(trans, lru_entry_to_invalid_bucket,
      |                     ^
fs/bcachefs/error.h:140:2: note: expanded from macro 'fsck_err'
  140 |         __fsck_err(c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
      |         ^
fs/bcachefs/error.h:117:26: note: expanded from macro '__fsck_err'
  117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
      |                                 ^
fs/bcachefs/error.h:111:3: note: expanded from macro 'fsck_err_wrap'
  111 |                 goto fsck_err;                                          \
      |                 ^
fs/bcachefs/alloc_background.c:2107:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
 2107 |         CLASS(btree_iter, alloc_iter)(trans, BTREE_ID_alloc, bucket, BTREE_ITER_cached);
      |                           ^
1 error generated.


Konrad

