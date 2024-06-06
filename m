Return-Path: <linux-next+bounces-2483-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD38FDF2B
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 08:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6951D28308F
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 06:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C616F068;
	Thu,  6 Jun 2024 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Argwp289"
X-Original-To: linux-next@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632DA13A3F3;
	Thu,  6 Jun 2024 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717656903; cv=none; b=FZgH43569tRPUAlho37j505fxTnZrjAnX7ukcD29U/CBR3iGxD5p7e/9TgL7kBtP0Irv5mc4aNnFqIKJF0jloozX6flyTbamdxMIasd4/0S6ghaXnJjpY4SZPpnQzX6BgncOMy3SRivgfyMbMcUMMaKc78y677OoB67WPArdTHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717656903; c=relaxed/simple;
	bh=kcnC+3mKw2MNUjSpm/Obg2JBXR9JihNnrWUySAol+QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oArcfztRRLU1diXIAT/FgDFMdAK2lzrZXApo7UsFdB2WVCkJWP5O7+OLjHTqPHt29c74SiveBJlfNhRiLLFWUo1ElxBY7qek7Yoox3GIoNG3GupuLXDBWV9oZmfTi/lmtSPCCapqRx7IgkfedmJBBk96o65ncE0DGqdkWZv9rlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Argwp289; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455JXWOa013589;
	Thu, 6 Jun 2024 08:54:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	l/lRpTt5Rq1WV/wWHn2/hGSTaS4YlRQv8vbMTb5QcQY=; b=Argwp289znJMr9BF
	CLxvhmESic7rNs2oaHfPY1tnMmfj55DNX6c8s84NAk1ltBQJZmJNhdtCaCqfS+Ws
	y8KHa8PA4Gmd9SpfJo9Ue3y3nCk5wbPeVHRhW4GALYUcB5eoJ9Ct5XPMNnlvoI8k
	AxBIofQbCubMQb83ALIYfqOS/agrBZQ//kjcM6aInWw3+TRwv1qPyLEyMUcaMlN4
	7OMZRrSnKU898Vr9zQ8/YodZTR3XbVgT2Z3HtPLii4rWl8ioa7kW1yRwwJPRAIcA
	aZjqik89F+eUVFiBolWpt+QHQKOFasPPjng5aVdcF6HEA/D4lnisdHhtFuQKEhEq
	8MsOFg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yfw30kyqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 08:54:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 306D440045;
	Thu,  6 Jun 2024 08:54:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4457A210580;
	Thu,  6 Jun 2024 08:54:27 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 6 Jun
 2024 08:54:26 +0200
Message-ID: <361a9191-c320-411e-a628-ff41298391a9@foss.st.com>
Date: Thu, 6 Jun 2024 08:54:26 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the stm32 tree
To: Marek Vasut <marex@denx.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Torgue <alexandre.torgue@st.com>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
References: <20240606091217.19a08b65@canb.auug.org.au>
 <a827536d-004f-4a5d-8995-321ba9926349@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <a827536d-004f-4a5d-8995-321ba9926349@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_01,2024-05-17_01

Hi

On 6/6/24 01:29, Marek Vasut wrote:
> On 6/6/24 1:12 AM, Stephen Rothwell wrote:
>> Hi all,
> 
> Hello everyone,
> 
>> After merging the stm32 tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> make[4]: *** No rule to make target 
>> 'arch/arm/boot/dts/st/stm32mp135f-dhsom-dhsbc.dtb', needed by 
>> 'arch/arm/boot/dts/st/dtbs-list'.  Stop.
>>
>> Caused by commit
>>
>>    12ff8e167641 ("ARM: dts: stm32: Add support for STM32MP13xx DHCOR 
>> SoM and DHSBC board")
>>
>> I have used the stm32 tree from next-20240605 for today.
> 
> Fixed in
> 
> [PATCH] ARM: dts: stm32: Fix STM32MP13xx DHCOR DHSBC Makefile entry
> 
> sent to linux-arm-kernel .
> 
> Thanks for the report, sorry for the breakage.


My fault, I tested to build the board using
"make  st/stm32mp135f-dhcor-dhsbc.dtb"

Fixed in stm32-next by applying Marek patch. I'll maybe squash it with 
initial patch for my PR.

Regards
Alex

