Return-Path: <linux-next+bounces-5933-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0ABA6BFE8
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 17:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 958A617ED71
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 16:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299C222AE75;
	Fri, 21 Mar 2025 16:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="Hyupkqa7"
X-Original-To: linux-next@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7462422ACFA;
	Fri, 21 Mar 2025 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742574572; cv=none; b=OYxNWHt9J964EZJJrLhrt52kgcldarrS9ow2Gzt0Ayeeql5Fy8OBhHnMs8oIAh0OTvG+s72yLPERvSXZT5c5nGT59JDf8OEmt1EOWtmd/uNFPbyM1dH74olZTPFXoJ1IEwUNbQXRByNznZvbvDmXCmDADCT6r9wBdSPZoLVVT+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742574572; c=relaxed/simple;
	bh=yIlBkQjeOtg1iUXRHxsVtlu2CYMWRHEH9LFbJxghFQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQvm9AKBij93mrKES05Fe6wgnZYtyomQGJgL0t9Ekfhl9sf6UV9WRIrLm8Jiqn/47P7yF4rb4xnQA2Jr1x40EaWWEZWGAd0CJ6CAx+xu2LWw9Qmfk3o2shAfz/cMWoJZC8W+CgkF9E8CKg8YulvaIjfAaZEt7TczcwP0MKf3e6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=Hyupkqa7; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZK7FP2Rhzzm8Sbk;
	Fri, 21 Mar 2025 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1742574568; x=1745166569; bh=pOvlZLMOQ8fE6fKCTKrLrZUU
	3Ly0UNC8CD8E1c9yvtU=; b=Hyupkqa7tNtLocFangibn62O0k0Sacu+cXVEFmzC
	HfzoXjf3+JCPhhNc8GfD0MojGr+7A4WxOBBv26OszWSHdHW8UEzT8Jmg80ypQBbG
	DbI4SVc3vMkyoVsHjWY/Ejm/ehgvEQWsAAQ2m9epdzkkd4dJgG2gEZTXlIm7mhaw
	PxIU1xqJK/VcjHjNgU595qEOnUmjwj99n0lUfeTt4qhvzkfgxQ3drBDkj8bzwg0K
	PLORPcZpEFkJIbDzxdTDjZsvUuubkOLiGNphFR3JyscWysbkPD+3x/p+5kx027Pp
	es9acIe5XiMZu0K+e6g2Ig1E12Nl3NYDUokAxQCHH3/1uw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id tqnhyV38ubUR; Fri, 21 Mar 2025 16:29:28 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZK7FJ6c04zm98pg;
	Fri, 21 Mar 2025 16:29:22 +0000 (UTC)
Message-ID: <6e024a8c-5d54-44dd-8ab9-cb1d269c288a@acm.org>
Date: Fri, 21 Mar 2025 09:29:20 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the scsi-mkp tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250321164700.477efe5c@canb.auug.org.au>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250321164700.477efe5c@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/25 10:47 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
> 
>    drivers/ufs/core/ufshcd.c
> 
> between commit:
> 
>    fe06b7c07f3f ("scsi: ufs: core: Set default runtime/system PM levels before ufshcd_hba_init()")
> 
> from Linus' tree and commit:
> 
>    20b97acc4caf ("scsi: ufs: core: Fix a race condition related to device commands")
> 
> from the scsi-mkp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hi Stephen,

Thank you for having resolved this conflict. While the conflict 
resolution looks good to me and should result in working code, it may
be desirable to resolve it differently (init_completion() before the
ufs_get_desired_pm_lvl_for_dev_link_state() calls). This way the
spin_lock_init() and init_completion() calls stay close to each other.

Thanks,

Bart.



