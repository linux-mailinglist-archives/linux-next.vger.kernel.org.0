Return-Path: <linux-next+bounces-7793-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8E1B170DF
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 14:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3F334E78C4
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 12:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A29239E86;
	Thu, 31 Jul 2025 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="syA1m6q4"
X-Original-To: linux-next@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300DF238C2B
	for <linux-next@vger.kernel.org>; Thu, 31 Jul 2025 12:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753963535; cv=none; b=ioXVIbOpZYuto3weo02cr0cTRHyveqngrUmkXpTCI19YnX2ftNaXsShEwIo5ePNnWBoiWxu/dWmnADovs2WsAW4krJTJL2NirRPBspthPcRhqqndTg7hRVPksT50n4Pdqt6oquhHt86z85Durl2ZGlbsxpGVYUVNL71YE7AR66s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753963535; c=relaxed/simple;
	bh=0OhHT85vfDxFfUKl5bFaao4Ffj0miECi4OIPrK8FvfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:From:In-Reply-To:
	 Content-Type:References; b=SJL2rviwFMEAHuaVRCQSqYGZBe8k5PzJwkzwtBZrfbNsY3vCN3GwDrKlFDSvp+/Cn5BnxPLH3lm2cykSje8yYJkUrNko6+81mJDnj5vm+7OULkNErw/7OveOKq1kmWKW0grw97HGuaqAbG0NOwHbtnEw5EPalFD2OIg5TgLQubc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=syA1m6q4; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250731120525euoutp0188b4dddcb71e7d85cf223d5211634c5c~XVIiEpznd0759807598euoutp01f
	for <linux-next@vger.kernel.org>; Thu, 31 Jul 2025 12:05:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250731120525euoutp0188b4dddcb71e7d85cf223d5211634c5c~XVIiEpznd0759807598euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753963525;
	bh=D+s6HM7jnNZxy8UpcBFlK9PEPJQSMqZi+TnwaQ2/vKQ=;
	h=Date:Subject:To:CC:From:In-Reply-To:References:From;
	b=syA1m6q4TpM7THJxzrcPPlXrmAKCrL3u73QjbwehwO+sDy5sd9qh3/2Mc+nG8oQ1c
	 brKE6L6MzPmhH1dJ8O+hn8N5y6zkgSF7W48dUXIJ0UbtxK853xLg+3m2CYEx2jv9NJ
	 OVdurEBoMRCHDn+mKmwHGz5G9wKrgpKB1LMR9wrM=
Received: from eucas1p2.samsung.com (unknown [182.198.248.175]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250731120524eucas1p1fb65cdb960ff9f4b22ce857404c38828~XVIhwWnac1720217202eucas1p1w;
	Thu, 31 Jul 2025 12:05:24 +0000 (GMT)
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250731120524eucas1p1175f6be9e304ccb0dffffd7b1bbaef1c~XVIhd7qkO1518315183eucas1p1r;
	Thu, 31 Jul 2025 12:05:24 +0000 (GMT)
Received: from CAMSPWEXC02.scsc.local (unknown [106.1.227.4]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250731120524eusmtip2e639815d76bb5b3d999c1525da111975~XVIhaW8xe1903319033eusmtip2j;
	Thu, 31 Jul 2025 12:05:24 +0000 (GMT)
Received: from [106.110.32.87] (106.110.32.87) by CAMSPWEXC02.scsc.local
	(106.1.227.4) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Thu, 31 Jul
	2025 13:05:23 +0100
Message-ID: <2f54da1b-0670-4f6f-b170-228ff90e624e@samsung.com>
Date: Thu, 31 Jul 2025 14:05:23 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the sysctl tree with the modules
 tree
Content-Language: en-GB
To: Stephen Rothwell <sfr@canb.auug.org.au>, Luis Chamberlain
	<mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen
	<samitolvanen@google.com>
CC: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing
	List <linux-next@vger.kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
	<thomas.weissschuh@linutronix.de>
From: Daniel Gomez <da.gomez@samsung.com>
In-Reply-To: <20250731110249.646be7ac@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CAMSPWEXC01.scsc.local (106.1.227.3) To
	CAMSPWEXC02.scsc.local (106.1.227.4)
X-CMS-MailID: 20250731120524eucas1p1175f6be9e304ccb0dffffd7b1bbaef1c
X-Msg-Generator: CA
X-RootMTR: 20250731010255eucas1p1a41d79989d9e35ce06ab88384c10c296
X-EPHeader: CA
cpgsPolicy: EUCPGSC10-065,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250731010255eucas1p1a41d79989d9e35ce06ab88384c10c296
References: <20250714175916.774e6d79@canb.auug.org.au>
	<CGME20250731010255eucas1p1a41d79989d9e35ce06ab88384c10c296@eucas1p1.samsung.com>
	<20250731110249.646be7ac@canb.auug.org.au>

On 7/31/2025 3:02 AM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 14 Jul 2025 17:59:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the sysctl tree got a conflict in:
>>
>>   include/linux/module.h
>>
>> between commits:
>>
>>   6633d3a45a8c ("module: move 'struct module_use' to internal.h")
>>   a55842991352 ("module: make structure definitions always visible")
>>
>> from the modules tree and commit:
>>
>>   6bb37af62634 ("module: Move modprobe_path and modules_disabled ctl_tables into the module subsys")
>>
>> from the sysctl tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>>
>> diff --cc include/linux/module.h
>> index 3b665cb0cabe,e93cdb92ad92..000000000000
>> --- a/include/linux/module.h
>> +++ b/include/linux/module.h
>> @@@ -584,17 -608,6 +584,16 @@@ struct module 
>>   #define MODULE_ARCH_INIT {}
>>   #endif
>>   
>>  +#ifdef CONFIG_MODULES
>>  +
>> - extern int modules_disabled; /* for sysctl */
>>  +/* Get/put a kernel symbol (calls must be symmetric) */
>>  +void *__symbol_get(const char *symbol);
>>  +void *__symbol_get_gpl(const char *symbol);
>>  +#define symbol_get(x)	({ \
>>  +	static const char __notrim[] \
>>  +		__used __section(".no_trim_symbol") = __stringify(x); \
>>  +	(typeof(&x))(__symbol_get(__stringify(x))); })
>>  +
>>   #ifndef HAVE_ARCH_KALLSYMS_SYMBOL_VALUE
>>   static inline unsigned long kallsyms_symbol_value(const Elf_Sym *sym)
>>   {
> 
> This is now a conflict between the modules tree and Linus' tree.

Thanks for the heads-up.

modules tree is now rebased on top of Linus's tree with the conflict
solved.


