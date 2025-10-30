Return-Path: <linux-next+bounces-8758-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE91C1E00A
	for <lists+linux-next@lfdr.de>; Thu, 30 Oct 2025 02:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4F9E14E14EA
	for <lists+linux-next@lfdr.de>; Thu, 30 Oct 2025 01:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7408253B42;
	Thu, 30 Oct 2025 01:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNhLPD3i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ykna3OBK"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2115E248F7C
	for <linux-next@vger.kernel.org>; Thu, 30 Oct 2025 01:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761786901; cv=none; b=WYpCqN27EEjCNmCubZruzLQkUDjKZ3Qn1NqcnJ4+JLiDXXBa4KcqvHGTY/GzHKpBLNHmB7eiuATAxB1VtuCSPwbtntJfko3+bwXA7WChH9FDR11inCOxQLvGTVBRJrxGsj9tTojZdtJe6xP+SG+sQSuV6TRJqgsmH5Ji538DOpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761786901; c=relaxed/simple;
	bh=JcdsJObsCPxTej1TgcKSkDEbSvqlt1gBALjn2o4FudM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGx7p4uPYPi3FLsZj14F2yJXOm8CawShg1lFKOCI2snygMtKT8F91rrZEt4oM8mpKzX7m5emTSK5Apvb+b6cwqhYrDgoz5dnNjxRMbl5SIURljxWs9rH/brd6pEtUP8GkvHjKTJgUmseAL9vOQIBqDvPWDERv6Xa1NyGzjAFLck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNhLPD3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ykna3OBK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TIs5KM1325181
	for <linux-next@vger.kernel.org>; Thu, 30 Oct 2025 01:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uplEjRjXn6n3hOHodOMA23ldjJzjv7AtZodGTNnhxNU=; b=UNhLPD3ifF4rVwn0
	U14gbgxpacljiEatqxFgv7arZ1DtzgLkh+a772vfZu4Do0s/WPan7dRUGMxSNIWn
	kFahZe39OKUl+e4t6CUcctsUdzjEAWcmK+vUjR/wSvCCFPFMAWOr25/UtwSu1aDI
	Ty/eCetrIlJ1wsF+NRhkJekDfb6Cv114Y8Akrqa7mKAvsHKIsV/rhDYBH8d+0cnt
	n9sTvpyejez7NVUkmYgitTPYWGmC3nvB3A/aemlTfHulZhfyZxILkLKHsvBrmQC8
	/kroevwpUQMeisdshqJ97Akby2ITYjQWOuouHrEzRO5gZpRYqOCQF5hRIHRneTfU
	jCkLug==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3rkus0dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Thu, 30 Oct 2025 01:14:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-781253de15aso1134007b3a.2
        for <linux-next@vger.kernel.org>; Wed, 29 Oct 2025 18:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761786898; x=1762391698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uplEjRjXn6n3hOHodOMA23ldjJzjv7AtZodGTNnhxNU=;
        b=Ykna3OBKtRI8fP5DNtJdHCVMNnfOyngWPVGRsPF9mQasS4OJJcM7/Q+VuCKiAT5mtL
         7RF3Pm7So3CUKgrdLLKGt4rh38UXuvXvwiBhvp3mJ0iS2DvE5z6AjsQqQ15Fe1xsR2qA
         9rTOvTJDYRDxxbPF6pFDsR+lR6NHcYye1kQiG6MqveEjM7gIVE+g7zF23YEsX5drSi/B
         XowQaRMcl+UVqsyJU23+ecFR6ApJqg6u2diMTH5M9QsqnTOkn81pU7jRJ+kalxf5N/Ae
         xewLA3WZAl7yQd/BbKQg9uEGcmrTJ4+a6l2ELPnTbIGjiO+aBmfk/YIUksbNmTm4J0d9
         Fmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761786898; x=1762391698;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uplEjRjXn6n3hOHodOMA23ldjJzjv7AtZodGTNnhxNU=;
        b=hS4/WhwfPEeRFGDHWfLPBDLp0fdWuTcvm3BOOFsePu6zPvqWDLnrMjwZkcoJmVJ2is
         e5P5k+Qzp/LB7VpbS42intyEoUmfuZc7VPLxJWXgwqnwAx1PzSObyVgvgAIO6cG3ygWM
         vYyRCs03FoaO+y33UmhlpgZgcq2g/dI9BsJnlHd7+aJ/RyL832WT1Uxu0sp5qOySnFsT
         Az7ZyoD9jru74R8iiCSsMHkI2oGvE5U/SM2QHMcRVURvLdBUAiWoTXo4OgNl1k2NHP7Y
         ujRkhaaQ6pk7+ny9UAUUG/A6L2C5rpayh84kezu9MmZrCSv508/MVmH9gx0EwRYn1hdl
         6IoA==
X-Forwarded-Encrypted: i=1; AJvYcCVFWcCY2SAfAMTZWjCy8ARgiAV3kcirw5O8CmY6IXuDwDEvznHTK1/2FCccGYG5LecbF+nhw27TXcQc@vger.kernel.org
X-Gm-Message-State: AOJu0YyCvYTMxhBHAq4VyJgT/opMIB3eMKzUqrBNsaDcv48Rj3/RYgI2
	yX7wHFKNDckME3pOt6QK2DctrtzaPCx+ij50/ToDys0FrlUhv/2P7GAVAGISsm+hwhfj80KuDha
	HI+A2IVxpDF+YUCb0UPT3RwjKIM+yRGuBJ0oV6zWODn2icClQTH5wvDCXalDMmAxE
X-Gm-Gg: ASbGncs8BsDnYwngRL3YztnkYb0Qxy74BCQK5cG+uE5ftiUc/CPq0BfudrubMziC+wc
	zlQfy8XceLJll98DrR6wqz5zVuU3wlqPs95gzMF5UxHX7CFXkeUizEuaTvHFlUP7Lhpbb0MOmXq
	taeWnobByL34vEyqm9lg7TLtzX7ngAWYpEKmgs9v5jT/o+iI6vLd+iyohysqdh70gyLxSUVBHqP
	yDcY8HjNOzYlgFul6uSHOukUhpKcOFofz4NbVKiLmcfK3DvlthckFY7+4K+M9h0n2pjQ4s2QGbS
	gc+VJiQrNSqxDq/YyjfCwz90+ZWkFAtl8KKok0W6FgbzrjJq7KpjrQfnWt51CBuc2FE5l7pjbiX
	scmwkGdH9AhZOTCMc/eAf1oLAK7lHaQopiDNDMBRiHMKm7tTL5LdKyy/pF2AfZge90m1aKi4=
X-Received: by 2002:a05:6a00:4f8b:b0:7a4:f552:b507 with SMTP id d2e1a72fcca58-7a62c6948aemr1423127b3a.25.1761786897937;
        Wed, 29 Oct 2025 18:14:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxg/gaMbHhmdQxq/ivXimd6Kc2sCy+uCcSh3cAwCWaFK2lzCgf5JPs9bcpzB5W6omR/iGAbQ==
X-Received: by 2002:a05:6a00:4f8b:b0:7a4:f552:b507 with SMTP id d2e1a72fcca58-7a62c6948aemr1423099b3a.25.1761786897435;
        Wed, 29 Oct 2025 18:14:57 -0700 (PDT)
Received: from [192.168.1.118] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41409e456sm16519817b3a.71.2025.10.29.18.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 18:14:57 -0700 (PDT)
Message-ID: <83c8504d-3159-4a87-a1ea-0fef46bf6762@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 18:14:55 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the ath-next tree with the ath tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Ath10k List <ath10k@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251030113037.1932c6d2@canb.auug.org.au>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251030113037.1932c6d2@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uMCQqR-tpSggglvLNfnhHrMj29Qjs-1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAwNyBTYWx0ZWRfXy4X2xZ7qGdqC
 ppcnZOnDWZWOigzSNPPEzLI2OjAKEy70domXLBEo5uocrcYFNrMuBbtrLO6FTmwwCqSW2ql/Rj0
 2D8LkFnc4rjh1ZGP0ekrPScokofWdre4Z28tn4posXipmG8dSEbIZdzBDwNC1E8y6gitWcWVd9r
 YN5vKp+7bQmzX1vhSb5kL+pY5woIOy6P6GhmJSUqQMQdbxXVGp8wP1ry4oZbUxMgzcCoS6Rd80V
 4XJA+F0t80+PnMcPYlD+BN/a+Y9INr8xQsbCxQpJHFwx/Qpg9IojEF38bKsdwweus0O6pO5BxjV
 O2VOQ8KJOxpVId71a8a2kayW4IjvWEEfOISD1SYkvHXBKPk/KH/fe2hUvfP6FXXXlah6NyWN2z/
 NGWpBwGL3l0ex5QuQH8KbWKfdTN62g==
X-Proofpoint-GUID: uMCQqR-tpSggglvLNfnhHrMj29Qjs-1t
X-Authority-Analysis: v=2.4 cv=adZsXBot c=1 sm=1 tr=0 ts=6902bc12 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3sE9uRzZUefYBai0eU4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1011 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300007

On 10/29/2025 5:30 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the ath-next tree got a conflict in:
> 
>   drivers/net/wireless/ath/ath12k/mac.c
> 
> between commit:
> 
>   9222582ec524 ("Revert "wifi: ath12k: Fix missing station power save configuration"")
> 
> from the ath tree and commit:
> 
>   6917e268c433 ("wifi: ath12k: Defer vdev bring-up until CSA finalize to avoid stale beacon")
> 
> from the ath-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks, Stephen

That resolution matches the text I've prepared for my upcoming pull request:

Note to maintainers:

There is a trivial conflict between two patches:

In ath/ath-current:
9222582ec524 ("Revert "wifi: ath12k: Fix missing station power save configuration"")

In ath/ath-next:
6917e268c433 ("wifi: ath12k: Defer vdev bring-up until CSA finalize to avoid stale beacon")

The resolution is to take both hunks, ordering them in reverse xmas tree style.



