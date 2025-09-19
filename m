Return-Path: <linux-next+bounces-8393-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E46DB8B33F
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 22:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64E615A39BF
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 20:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC236262FF3;
	Fri, 19 Sep 2025 20:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="d6bAacwE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CE5225D6;
	Fri, 19 Sep 2025 20:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314667; cv=none; b=EdrlfDoIi/VsFPGYvcc/CKX8uAwwRR/a2jqV/YHEPx/5al9AJce0i/Vmln7AQQQRg1X4TWYA2fqDhqXzbEnVsVxSubIgjVqqCWcJj8FgWA394vxnHKaSDCSYXLTtgAI1vqUoAGL//vIa6L5VKL8gU70pSpI3RIYDCzLEjljiDlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314667; c=relaxed/simple;
	bh=XSsHouukci34LDKNJRaLQcWAJVMiiijA5K6/oNjb/0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnISSplnQmGYYryIvC2FG5GCudveKSvODJ0iS7OB6fIXltUznOz882CyclztXB/3ar2ypavBE5avcNNgNQU9GufFEknzGS4gbq6w3RpQ5ThiqsKXXkBOgmuq7BeSkR+kFLhKLhqILdcePVbf8b3k+nBpyxptIGddpbQukhc+77A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=d6bAacwE; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8070340E01AC;
	Fri, 19 Sep 2025 20:44:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2uXJAggRLCsu; Fri, 19 Sep 2025 20:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1758314652; bh=ogLSSDPgWHiSXjhfA6iLzlBNOW9gCGPBOfCNPe2G088=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6bAacwEbRmcZc9dXYAzIC58xdAOB3KgH5nQI5Zih9sGO3LdwKpofPsKRbcFv1GKX
	 maGCsGTtAH1k9uvEaykmNFAA/0PlSL5QdXp3NEUihXgp6QHsvSNZkZB/dRVUfxni5q
	 L2mSWlcaBVj/OFJ35LxRV/ByS0JKqehLXTs10j4N+GFccE17hVCAeGhJ0j356xFNSC
	 uJVANmzB8fJTtMIcZm8WBrbl9e9RIIbde4zKD8ULpjZFmcsDiEKNFDUfEFa3lRzCnE
	 yNZuvqNqZ2KoGfFq1U8cTChiByxl0OY+sIlQdk1LDjRziaNIuBiBkxTVWbaoXsuMR3
	 xpvuyBcQeofgAhV06dtRL8tGmNkNuFBzDJKzIBXTXYJlyn2fyUr8xtYynLXU8hFOcy
	 hlQ6PCzpKWrQWbdv9T8H+aNge1mZzZWKELmwKtfVwRHzpxowPHTIkaetWXRtXEmH07
	 giTXT3NlmtVNIJtIG2kUGNrTr8kc4j679qX8FxeY/vK49cThW+1Z8031x4ghckeOMV
	 tNq6rXXP0n4h4tIacItZ7xcHrqMNwKj0WN+Mq1GbCQXd2B+iXpRkqAsA/m5LJiV1dl
	 /rajUJZRhVbuYaH13joMdWbMb7DNsQj/pAk5quFX7HeRwmecyhn9qm7eOu+ZeUciFo
	 PgAgbat7iYNJdEhyoJizNv+M=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 1F96D40E01A3;
	Fri, 19 Sep 2025 20:44:03 +0000 (UTC)
Date: Fri, 19 Sep 2025 22:43:55 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mark Brown <broonie@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <20250919204355.GHaM3AiwTM25LiOKAb@fat_crate.local>
References: <aM1bJqhtojdLhp3c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aM1bJqhtojdLhp3c@sirena.org.uk>

On Fri, Sep 19, 2025 at 02:31:18PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   drivers/crypto/ccp/sev-dev.c
> 
> between commits:
> 
>   45d59bd4a3e0f ("crypto: ccp - Introduce new API interface to indicate SEV-SNP Ciphertext hiding feature")
>   33cfb80d1910b ("crypto: ccp - Add support for SNP_FEATURE_INFO command")
> 
> from the crypto tree and commit:
> 
>   e09701dcdd9ca ("crypto: ccp - Add new HV-Fixed page allocation/free API")

Pff, in hindsight those should probably all go through the crypto tree so that
there's no unnecessary conflicts.

Herbert, lemme know if I should undo them here and you take all three:

648dbccc03a0 crypto: ccp - Add AMD Seamless Firmware Servicing (SFS) driver
e09701dcdd9c crypto: ccp - Add new HV-Fixed page allocation/free API
e4c00c4ce2aa x86/sev: Add new dump_rmp parameter to snp_leak_pages() API

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

