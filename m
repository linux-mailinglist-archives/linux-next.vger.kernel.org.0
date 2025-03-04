Return-Path: <linux-next+bounces-5639-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7AFA4EE7C
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 21:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EB60189216A
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 20:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E091C2512FC;
	Tue,  4 Mar 2025 20:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZ6O9x86"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AABC20C039
	for <linux-next@vger.kernel.org>; Tue,  4 Mar 2025 20:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741120511; cv=none; b=KeELBwh7DtUhA0muLeOlcFcWCkTzr9OLDUhyyOf37eWCIz7YDec6O4WCFVjS/o0rXp5/gjWlUs9ArGbcHfpsNmcsz4hfBKA3gwIGg6JPUXGSghGeTgLq8X/8u8blQhBpHf2sleGUfW2SPANBMK2PJKA0AlxKgzlNd802JSw7Chk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741120511; c=relaxed/simple;
	bh=5CATaT+vuXFneRrXovUb/F8vmYFOLFALDZsrIyHu084=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=A1U4Ctpd45KiLD7KQxS64npUKYltExPCjjokR3xfA9JwgW4Zy5IncCfC106D+NZtCaQ8ATuznesEfDGi/EC2/9nljZF3gEAbCBjxW/LD1/OtyzdgSPZdEByeKJtkZKIoLfDJUZilvgeC/Kevg/CwzRCA8rinbdxu79RiWPV349s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZ6O9x86; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5249jqOq017199
	for <linux-next@vger.kernel.org>; Tue, 4 Mar 2025 20:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lyZ9KZcmAozLbf98x2GQOc
	SaLEpjLWxAVW305JA8sSA=; b=VZ6O9x86dhpapq58oisVwF+VX8EnWerCBDuG7M
	iY4rYC9V4EoLi+TsBbjqN6IvFlEpBDoo6xWP5yhplL9yzXvtrl8DQyxYE6Wo6LcR
	jEM7KsGJsjevNtBhn8iFO0uQoZcB5eqsZT/E09N3LIxB6GIHCmUWqBFicLBHdDOD
	RB+WsHb2juvqGeoUfIQgXe8cgx3oLgYgkRpaWBeF6BgNs/yPU2qyWUehD10Yih6I
	TgfH8fcDX0gAt358/EC82ld9yGHJmVligUcDibF37NJ4KZd7a5BCEtzUzvSULxFB
	aTRaWtNUrDHQR1wIndrTTkVcAhAwWWS0jwpe2/4JQC9l8rQQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tk5k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 04 Mar 2025 20:35:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e895a1eac3so7676846d6.1
        for <linux-next@vger.kernel.org>; Tue, 04 Mar 2025 12:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741120508; x=1741725308;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lyZ9KZcmAozLbf98x2GQOcSaLEpjLWxAVW305JA8sSA=;
        b=Mn0Vd0Ksk9IhtpEyVgvvJOUzdyXASZrNQiDA/mA9NmK1X2I8KOQ1Ck4Q3G1QNgHwpy
         1L2mwDVJM0MDODf2D7ypZXnLuf/fbtHu+xAzJdxFcU3UsPklcUvimhuDq7N8vZs5WH82
         aozQJEfHM9/QR5F6Nfsx+P15jH2CClUjsAtze68UkLX3nZFntTJsdKuN0yrTism0gWqz
         jwRrbdTg13URQQnNz5se/w5QcJdPO/07HNB9143+Zcur3KEnO1Fra62UrlxkPVmdEjsS
         jSWVVOU8TJT7M6B5PRWM25Oq+4SeyzVqGJz2pkIYMY30tjcjg1Cpi02SH5kW/8h/Renw
         oQmw==
X-Gm-Message-State: AOJu0YzVSBTzylktvQctIgR52JvcjKpeTKikwCUmg0VezroczjkUHtX3
	+9rM+0YpSxxI8i2m2gSvgPKzjJsZ9U3AZvEQrvNjFWDo1wLMzJZKbuY4m+KI5JVQvcyOb82D86q
	PdAGUdB6pADxD4fdtFif764+7Z91QoXr+FHG58e5JNNyHvBOoAYFscw2gb3UVowwdZR5W
X-Gm-Gg: ASbGncuDN+gDCdK6QXBd8eeWYztoEEMbSkE2QAoq8S+K2fNYZCl28oqZX6OXYK9IjuO
	S7+i54weSFZPVr0pq75v+Lex7CeRpmLaYwU4X2ftt3JqlCoKO2iIWk05pnWH+cVvzjkLzmvIMlg
	6wDipg/kxug3g02yjW9mP+DgjsyjdPjUJu8NLj4rHjsupaMKMOa8qvgI+BjiXKLauzI6IXU53xT
	Rpi5XQW9y378cJ8tO0DnbywQpgnNKVggLaMwh1Rryqe9SsVDoJ/lcGRX2pI22ceXu9am239+x/b
	Nspid1rPQ9uHQpHiGPb4ILH4vb/iG62h+fMRB+mD/I+qAhukE+lfqE10ogYOkx6M0WRz0w==
X-Received: by 2002:a05:6214:2508:b0:6e1:a79c:4cb8 with SMTP id 6a1803df08f44-6e8e6cfee62mr3885856d6.2.1741120507825;
        Tue, 04 Mar 2025 12:35:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFm28h1xllMq2tXJKOJVS15ihtJCh/TUXmjO3xAQyRHvzHPVSZ3k9O4oOnfXIB7q9n+dowrqA==
X-Received: by 2002:a05:6214:2508:b0:6e1:a79c:4cb8 with SMTP id 6a1803df08f44-6e8e6cfee62mr3885386d6.2.1741120506736;
        Tue, 04 Mar 2025 12:35:06 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf45b506a0sm722319166b.30.2025.03.04.12.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 12:35:06 -0800 (PST)
Message-ID: <81fa7a0d-ed4b-44cd-b2e1-779a42401cbe@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 21:35:04 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Next Mailing List <linux-next@vger.kernel.org>,
        Brendan Jackman <jackmanb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: next-20250304 build failure
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c763fd cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=6OJpePoKIdf77JAHNpUA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: tJdllET1nbVTyRsO_pIIJx2uqfBYxyX7
X-Proofpoint-GUID: tJdllET1nbVTyRsO_pIIJx2uqfBYxyX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_08,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=463
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040165

Hi, I'm getting this build failure:

mm/page_alloc.c:424:3: error: call to undeclared function 'in_mem_hotplug'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  424 |                 in_mem_hotplug() ||


building next-20250304 on arm64

Caused by 

b4cfcc26f507 ("mm/page_alloc: add lockdep assertion for pageblock type change")

Konrad

