Return-Path: <linux-next+bounces-8910-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8F2C45C8F
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 11:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 282B64F054A
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 09:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2ED2301716;
	Mon, 10 Nov 2025 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="Svnw0OTo"
X-Original-To: linux-next@vger.kernel.org
Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1983016F0;
	Mon, 10 Nov 2025 09:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768557; cv=none; b=eovgVgDZOOkda6FJKQVEtHw0MrFCzuW9nrfjYbnLY5FyySJ9Sf4jRJ59RHZF8tEV4+pZI3y2jLUwno9ns3LoODirwkZdHnc4m0eqe//qYKZq8XkO8czmwjXyQhe/wC0VgfrpWySYNAHDrA3HA0glVNWAgKMHnSBFtTd6ZwlSndw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768557; c=relaxed/simple;
	bh=wsPWCXS4NOREA5ZX2rDTE0G02mKkk6b/v6ZohKrSa7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D31xPOt+Qk8gmtz0wAoT2t7WDyuoKkPsqghFpKVPTfdS7zMck58jMJeTKUY72DZjrHqTF5bUjjXbClp+ddpTpC7cC05IkOJ3pJCWKzrVp2GZBabo1tGJtNydzpknaUEglruu8DZ9xbI4O8svTMnzoXC/ul/QjNeP6gQrmJsAoXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=Svnw0OTo; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 391CE1D1D;
	Mon, 10 Nov 2025 09:43:58 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=Svnw0OTo;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 3681021D8;
	Mon, 10 Nov 2025 09:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1762768037;
	bh=voH1Rv006o8A7RjE1XYleW8tjbC0FIHx+wORPgKYlpg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Svnw0OToM66eTFjVNtxpyjJaf5u+u/k9X7RFm00Xtwnc9wmzUEoWOuvWHrRucTQcd
	 Hh9vqMMBaJ+NUff1tfnQyIqJexQdJHXlPQvg/0g2jJkJ11f43CoRczByXq9a3bApaW
	 qpwiZ55essbLr+9i6sxNVtv9KOysAx/FYY95L7rc=
Received: from [192.168.95.128] (172.30.20.129) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 10 Nov 2025 12:47:16 +0300
Message-ID: <033fe015-f96f-40d1-ba63-995982f7ba26@paragon-software.com>
Date: Mon, 10 Nov 2025 10:47:14 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the ntfs3 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, Christian Brauner <brauner@kernel.org>,
	Yongpeng Yang <yangyongpeng@xiaomi.com>
References: <20251106095733.600e04ac@canb.auug.org.au>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20251106095733.600e04ac@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 11/5/25 23:57, Stephen Rothwell wrote:

> Hi all,
>
> After merging the ntfs3 tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> fs/ntfs3/super.c: In function 'ntfs_init_from_boot':
> fs/ntfs3/super.c:951:9: error: ignoring return value of 'sb_min_blocksize' declared with attribute 'warn_unused_result' [-Werror=unused-result]
>    951 |         sb_min_blocksize(sb, PAGE_SIZE);
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>    c1b61f715e4d ("ntfs: set dummy blocksize to read boot_block when mounting")
>
> Exposed by commit
>
>    8637fa89e678 ("block: add __must_check attribute to sb_min_blocksize()")
>
> from the vfs-brauner-fixes tree.
>
> I have reverted that commit from the ntfs3 tree for today.
>
Hello,

Thanks for the report and for reverting it. I’ll prepare a fix for this issue.

Regards,
Konstantin


