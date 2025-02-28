Return-Path: <linux-next+bounces-5612-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDD7A4978B
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 11:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0849B170413
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 10:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C7825D522;
	Fri, 28 Feb 2025 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="jgRwO4Sb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EBA25DB08;
	Fri, 28 Feb 2025 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740738985; cv=none; b=d3+BlL0XwlWSVa8jW3leQI3OV1x/+cARYrNv2ES/td5/Q/yGHdZeg00v7t0yVcO/HSwH37gD2Qrab6I3NXyCS9drbDMUsRQQijrWINTfxiWHS56jyYOZdweSvefWg4wh/D9/BY3WJwNsmtAqV3lun8FHt4hoTuqk1RDeRzLMeK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740738985; c=relaxed/simple;
	bh=n9NScbAUz0eEndcKFNF0cPZfxJejwvRcMwJYXIVTry8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3/LWYOHQaAWR8o95FxHUjPjo1OVFqMhN5LELGBtUUQ6Pfnc3VLpenwY5pz7LZE2GBkSbIAaPZRHkVy9tvr+csQl1S8Ri8hg3WSD4uvB3h8uO62fBxNgPLSvQlEYBVgdK5jM+jTz3VPysTUfv7Es+P8vFYQ40coC6s9nzmvBQr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=jgRwO4Sb; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5FA8D40E0028;
	Fri, 28 Feb 2025 10:36:18 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cHQQoRjxASSN; Fri, 28 Feb 2025 10:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1740738974; bh=44+wDEjPOBvk80IirH57sf+bjdA1eQr7rlXx157Vc8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jgRwO4Sb1lA5FjPbTAW0KUnnIxMC0qUqrKqrG0wDAXSxFqPyEBCSwcOQgbPtqSOA2
	 lbCWyw2Pi4WCtsqKcwOTZMxVHHEf18yXub7Jr5exNIeqA5b5dlLS2tQwJURkJL++fL
	 jT8gOGI1Xj8nDnVT5Ad7uU6NJdQZ8pUSblbb/o/d73rBGAiMzt1qDCDaorC7BLMRsD
	 cHQTCNKsr/FmCRe5SjEzfFQCc+8CjUsQemD/gR/vkjkYZ+c64y+X+EHF36WkRpEZg5
	 Lp3V6lf2amISwuOphFE8+hTLnjiPbnobRhzwLJWKSGbU0x7DTYbddUlKnfCE2FCS6l
	 WSdnKuO7NZgoZTwmrP7pg3d0c/3hpenEMNAH2YIePL9mnoCCSKJxupSgbJOvP95P7P
	 TUlRaWdUpf1qfg3PAroVfiGJGF95zt1z209DlvplZ4QnJLyCs9gmKz+RHR/3UobUeM
	 kKzJ3Qi9fdr/EjhFORlHOArwUFmSZH7rXh4dRPbtzxC17z0DbXws26id+iu1aqxbQ0
	 G0GrNFJSqwRVYtZ2HSKJgfdoGT+ixIwtkvb6PEP7uuU9SNqb06KuxswOXmDzzZZIeZ
	 y4hLWL9eYL2gJiIuucptPEy7epscMvU4AehTDuYsbJxEmtyNaDJAePgH/MJCIJmHOK
	 XxM10/hSmIadcae8WYjw1dIY=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 30C1240E015E;
	Fri, 28 Feb 2025 10:36:06 +0000 (UTC)
Date: Fri, 28 Feb 2025 11:35:59 +0100
From: Borislav Petkov <bp@alien8.de>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shiju Jose <shiju.jose@huawei.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the edac tree
Message-ID: <20250228103559.GAZ8GRj0xj6AKGVLj3@fat_crate.local>
References: <20250228185102.15842f8b@canb.auug.org.au>
 <af3e1e183b034ea89ed6582a5382e5c3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <af3e1e183b034ea89ed6582a5382e5c3@huawei.com>

On Fri, Feb 28, 2025 at 10:04:57AM +0000, Shiju Jose wrote:
> >Hi all,
> >
> >After merging the edac tree, today's linux-next build (htmldocs) produced this
> >warning:
> >
> >Documentation/edac/index.rst: WARNING: document isn't included in any
> >toctree
> >
> >Introduced by commit
> >
> >  db99ea5f2c03 ("EDAC: Add support for EDAC device features control")
> 
> Thanks Stephen for reporting this warning.
> 
> Hi All,
> 
> Following change fix this warning.

This branch is now public and immutable so you need to send real patches with
commit messages which fix things ontop. But before you do...

> diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
> index b52ad5b969d4..ff4fe8c936c8 100644
> --- a/Documentation/subsystem-apis.rst
> +++ b/Documentation/subsystem-apis.rst
> @@ -71,6 +71,7 @@ Other subsystems
>  
>     accounting/index
>     cpu-freq/index
> +   edac/index
>     fpga/index
>     i2c/index
>     iio/index 
> >
> >--

... let's see what Jon says.

Jon, ack?

Is that the right place to put this in?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

