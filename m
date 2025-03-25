Return-Path: <linux-next+bounces-5999-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D1EA70482
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 16:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCC5F188DC77
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 15:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0EF1EDA3E;
	Tue, 25 Mar 2025 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y97GqSXP"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C14208AD
	for <linux-next@vger.kernel.org>; Tue, 25 Mar 2025 15:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742914999; cv=none; b=FxnjS024QT7YXtcPvyHhrKtbkhB2uVvoHWFXJkSbGoscQ0aNTunnlN0TBqkqQbzzi4i80svt1uZsOM89+xIQjanQybhPNU5DCssY8LOXc4HHtlKsQcQwBe4TeLvdQvmxRRq/vegm5Qpq9+82cwhuEZ4aXtDrtLzJVPBxbdkZI0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742914999; c=relaxed/simple;
	bh=7A7ZDiOqHnUbfvAS9wZIZIbSODMZmjd4GPAjhIJ24S4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=It8Dkp+JelTqgM59jbbHig/QnYE9JB9CzrH2QvYQRprfaVNQKrYDXUImlKzaGL6nzq1ezS7Z9Gw4k24TiyWb4qgBv9EGX2O/oapBt0Ndwz5+uXIxkeTKxCGcFRoja2RfhKP74MieyU1qaQTkJgwWVgs50sBjTbkx2jAM6OVePl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y97GqSXP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PDAwYL032670
	for <linux-next@vger.kernel.org>; Tue, 25 Mar 2025 15:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7A7ZDiOqHnUbfvAS9wZIZIbSODMZmjd4GPAjhIJ24S4=; b=Y97GqSXPdHOVcFGc
	0ivk+KFR4Ltol1b4CCpfZF3wLEVhwNUrenO/s5RdyH9G0ESURNCgpO+744YI4c/b
	1IWILmWtm1kMKeCVW4te/1m/uxOfHlIJ6sPwJKAF8VJGSrlwW2WIvwxV3uBhsn5S
	fMiPEm82erfCBSgK1aLt+7JYIAQQAcZ+RUp+UNAtKdncbSs6LAqXL3qkgAjR4Qug
	WHISKlpYZqtW90PSRsDrRMMewxgdUP1aU23FC3J4+qOAGlcrL/ArGr06oh0EKeHc
	Cv/KQIIY15Ryk+MWor0yRdGMHwdpRjDq10xevjmRxku5twq7ZPkP09U0DwZ7JRt6
	Q0wESQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd31y99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Tue, 25 Mar 2025 15:03:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22412127fd7so72326395ad.0
        for <linux-next@vger.kernel.org>; Tue, 25 Mar 2025 08:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742914987; x=1743519787;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7A7ZDiOqHnUbfvAS9wZIZIbSODMZmjd4GPAjhIJ24S4=;
        b=q9kzHu7VhFPGho7ncAusWCJXkluv73JnMAeIZrUyEaXb1JuTWq8wqnqSmu+9BG7LuN
         IgHxizKCHecHt54O4MjdY7dUk2386MrzudkQmJnmNKqrFr09CgapS7bdZqZMCqkqF8NM
         UDpDGd7t9zEN103r1YwI0lxDVUlS2/X7fO5NyevausyrwGl1WDB0CxuhoJlceTKrtZXq
         T75olD8FWxunq8BmVagTt88CRdlSmDvbyZLfZc8F4U5oW8UdJbORGV8Zq9kgVMKYOXcu
         h89BuCarbCiTBOHRE9qAcSvnmzjnldL3tNeaTvcXWjA4EXv8qKmHyR/JSr3Zo/LFQTO8
         fAWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9nm1ANuQ1RyfWJzM10ZYYSwXdGTFiQr6yqKLspn83XZvqx2QyLVRNbUpgvPULPwrLsOcpDCl8pJdW@vger.kernel.org
X-Gm-Message-State: AOJu0YyruT/sEeD3FzPJ6XoWCTzPvbWLveqxIAeuc91ImJv1yo9IO21j
	CxweMy+V+3A5xH+DfoxJEyVMHnxSaEcjc2nS7mHdGiywshq2QkxuJbg5PgQNM9MZw4hM9rFk2fm
	3ElDfs1A5v7nB/UoL+yJ3V9KQaVwmAgsE1QmlUlh6+ypifjBhf1CEnY9JGwA2
X-Gm-Gg: ASbGncvyFdGa/iqjWkyhiZong8NZPjtwPX526TYHUrc7saO8T1pcFvu9RSgvFobNQFs
	FkyUyWdRQGxZH8YuSkXc4gPYYmjCu0VdkTp7v6m9U/bSWYEVP/MUw3iRF4EyeEZ+tIEvLpQhNLF
	lEZA14KpDUZik19mNp2EeTNy/JF/rFQWSHYSmLb6ao+YUYcsoDR15BRt/L1+Klol7LB8hI38EHu
	km+bJ15WZKbTUkrYDmASnB+TnqpIYafmRC5X32NOrSKGWQArt4uI8xk80n4Mi/C0vexiqlvHVAm
	JuaceSX7CW1OSw3E7p8j7SP8MitqvXMwqi5Y1giTgnXlXjH10fh55L5xMHBvJY8jGH0NFTE=
X-Received: by 2002:a17:902:f54a:b0:220:cb1a:da5 with SMTP id d9443c01a7336-22780e1a937mr232137265ad.40.1742914987429;
        Tue, 25 Mar 2025 08:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj0G17oKrsRqQ34Kky25D17MpTcUUHpiNy95lIxkySWp/0bWIokIF4DIpzUQhqilnLyTxDeg==
X-Received: by 2002:a17:902:f54a:b0:220:cb1a:da5 with SMTP id d9443c01a7336-22780e1a937mr232136605ad.40.1742914986741;
        Tue, 25 Mar 2025 08:03:06 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811d9f1bsm91378175ad.166.2025.03.25.08.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 08:03:06 -0700 (PDT)
Message-ID: <978e72a6-0da4-4eb2-9c18-5b42db543160@oss.qualcomm.com>
Date: Tue, 25 Mar 2025 08:03:04 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] samples/livepatch: add module descriptions
To: Petr Mladek <pmladek@suse.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Josh Poimboeuf
 <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Joe Lawrence <joe.lawrence@redhat.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Easwar Hariharan <eahariha@linux.microsoft.com>,
        live-patching@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250324173242.1501003-1-arnd@kernel.org>
 <20250324173242.1501003-3-arnd@kernel.org> <Z-J--iv8LzgArWAX@pathway.suse.cz>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <Z-J--iv8LzgArWAX@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WNc6PdK-tyJkrCSbRYpDdj-JgcN_jisn
X-Proofpoint-ORIG-GUID: WNc6PdK-tyJkrCSbRYpDdj-JgcN_jisn
X-Authority-Analysis: v=2.4 cv=P646hjAu c=1 sm=1 tr=0 ts=67e2c5ac cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qSXTfUft287E2HETxpAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=937 priorityscore=1501 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250106

On 3/25/2025 3:01 AM, Petr Mladek wrote:
> Arnd, should I push this via the livepatch tree or would you prefer to push
> the entire patchset together? Both ways work for me.

My past experience was to let individual maintainers take the ones that apply
to their trees, and then Andrew can pick up the stragglers.

/jeff

