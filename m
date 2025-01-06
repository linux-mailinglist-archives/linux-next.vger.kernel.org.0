Return-Path: <linux-next+bounces-5060-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE59A028C1
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 16:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89E4B3A15F0
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 15:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F6270802;
	Mon,  6 Jan 2025 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="prUJgM59"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E531C69D;
	Mon,  6 Jan 2025 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736175925; cv=none; b=gyd/S4o3boZVraHO6ZNSl8yjHqenNmQD8jyj6IkRCEXzSr4r0gRNdOgxw3S/Vb143+ZFR6N8RCHx3N8EnRuGmcjjsGPNrqxUzP/sU0gdoWTPw6HZSOhp1x08EHDeDG2JKy7Dtx6BgbaCwSZVQAg6DeKJLJcwzeBIny8vaMVRJZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736175925; c=relaxed/simple;
	bh=CKZ/y2MCSbd/WTnX5KQeqeg+/YTKVBzr7RHLVbAB25U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N9r/fA1+wmkRcKeNLOMeX7mWdiogPa+7+stfwkBmwEOPpucps4Vfn+I2gwHDDsWTZ2NsCFNajioYCrVHF9akzbVnP5HNATnaZwxS5Q8bOGTIrXaqbjRC+uiQ684+yzLOYQEXEGw4DqukIHEkHKF29PCOr/e9aHbRL/6bEBJ1dMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=prUJgM59; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AF556404EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736175922; bh=d9e4RTfPeEbapGYG7kGReecGHzVwmMNR/uVeZYfgs90=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=prUJgM59VRFHuhPEIOgdxx9yUKEeedMoKB26iwEJ6znb9H+Mf/Dii91ScUIZDQ23p
	 HjEgmsjISmfWd7OTYrw8f0yw+0dvpOaUFcdprRnqGCjFfB+FooAgbdzqOqbpJDYXpH
	 lTC/MEarqdM+fS1QQKu4LH9Jxap6PSwpnprY/DmrQ0+m9hRCmkITrl3N5yQ1RHExHg
	 tJccpGsrKYDBtIkQFxieTvhG+P8gV86E1ArZjkIIV5+88+Hi0w8ROqfH7g732EmKsu
	 09QIorXWtv6XNR57VAutBQ73N6EoealrldW45L8P52VMOaSB2ySz7kSK+KbErgPwtB
	 JBF5+NbLU3Vcw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AF556404EC;
	Mon,  6 Jan 2025 15:05:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: Re: linux-next: manual merge of the jc_docs tree with the mm tree
In-Reply-To: <20250106095826.140c01cb@canb.auug.org.au>
References: <20250106095826.140c01cb@canb.auug.org.au>
Date: Mon, 06 Jan 2025 08:05:21 -0700
Message-ID: <87o70kt232.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the jc_docs tree got a conflict in:
>
>   scripts/checkpatch.pl
>
> between commit:
>
>   253f01394dc0 ("checkpatch: check return of `git_commit_info`")
>
> from the mm-nonmm-unstable branch of the mm tree and commit:
>
>   6356f18f09dc ("Align git commit ID abbreviation guidelines and checks")
>
> from the jc_docs tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The fix looks fine, but...

> -- 
> Cheers,
> Stephen Rothwell
>
> diff --cc scripts/checkpatch.pl
> index 744328d21eb8,f7087dda9ac9..000000000000
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@@ -3237,12 -3237,12 +3237,12 @@@ sub process 
>   			my ($cid, $ctitle) = git_commit_info($orig_commit, $id,
>   							     $title);
>   
>  -			if ($ctitle ne $title || $tag_case || $tag_space ||
>  -			    $id_length || $id_case || !$title_has_quotes) {
>  +			if (defined($cid) && ($ctitle ne $title || $tag_case || $tag_space || $id_length || $id_case || !$title_has_quotes)) {
>  +				my $fixed = "Fixes: $cid (\"$ctitle\")";
>   				if (WARN("BAD_FIXES_TAG",
> - 				     "Please use correct Fixes: style 'Fixes: <12 chars of sha1> (\"<title line>\")' - ie: '$fixed'\n" . $herecurr) &&
>  -				     "Please use correct Fixes: style 'Fixes: <12+ chars of sha1> (\"<title line>\")' - ie: 'Fixes: $cid (\"$ctitle\")'\n" . $herecurr) &&
> ++				     "Please use correct Fixes: style 'Fixes: <12+ chars of sha1> (\"<title line>\")' - ie: '$fixed'\n" . $herecurr) &&

...it all comes down to a single "+" sign here.  If 253f01394dc0 could
be tweaked to add that character, I think this conflict would go away
and we wouldn't make Linus delve into Perl code...?

Just a thought.

Thanks,

jon

