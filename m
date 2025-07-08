Return-Path: <linux-next+bounces-7401-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 919C7AFC534
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 10:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 699267A5006
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 08:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477D929E11B;
	Tue,  8 Jul 2025 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCxjOoTT"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D71729E0FD;
	Tue,  8 Jul 2025 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751962550; cv=none; b=jzDxgCrspEm+zO4i5P0GA9DduLP1Zh/POzEitO2G0So9NJxcGvHF3VnPt/x2lKfQvLQYaJrm299IqlP5VTlhQh017Ere1CnA0j9z2T09wrTxAOcnVAnREIYNc7nhLcc/dk/tP8tcx1l0E2+r0nKpmpcqPZhQkE2m9/lhPecQQpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751962550; c=relaxed/simple;
	bh=4IXCxN8x8dRMEj0XOpaisABRJ9TwS7xrANdPltngbXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfuARI6KSaS2VVjVqw0q0qGYkv+SbXjwc1xztSq6NFSXInRLjF9t05avXEUpQegwfpDFLIPW7du42XUsYU4RE/gckJR/G1tH8LgJFQdhrwtrlQkeMIDEbnfGntY/cYkOsRlXwjWbi7kEN6umHBIg9q4m4OQrprDzYbNnJ87ZSI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCxjOoTT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93906C4CEED;
	Tue,  8 Jul 2025 08:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751962549;
	bh=4IXCxN8x8dRMEj0XOpaisABRJ9TwS7xrANdPltngbXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCxjOoTTNd7Er+9A0ERmiDxRTufY7b1KP8XLKf6mZ1DoKVMDWJfZBIOzenjH5yMao
	 GzKEzy1/p+HT2YqxfOgSCoKBzUi+LNbTrQaRA9w4NXBPKJ2Xkz0hJ2z1SDTZohnZ4R
	 OVqaibSkMPL88qqUJJ9+db1VP8aIe+rhjphpT19gINNLilduYiKQLU69D2oeLggesB
	 cwu7ViA4q/LTzK0mYjJmyNSjiYA6+Vg7MNLB8gjBf9m9x9UesOkLdVaePGQ/SQrsgJ
	 tCA+/70Opl+yi8ZqMf8TVblFdrn01heK5vQ3Um7h3Er4RvBdo1DA1Rjc/PqUZHisbo
	 8+IIjf0TGNcLw==
Date: Tue, 8 Jul 2025 10:15:45 +0200
From: Christian Brauner <brauner@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs tree with the vfs-brauner
 tree
Message-ID: <20250708-podest-waldbestand-1d2bcbabad8c@brauner>
References: <20250708093837.52e3a89d@canb.auug.org.au>
 <20250708002509.GR1880847@ZenIV>
 <20250708004550.GS1880847@ZenIV>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708004550.GS1880847@ZenIV>

On Tue, Jul 08, 2025 at 01:45:50AM +0100, Al Viro wrote:
> On Tue, Jul 08, 2025 at 01:25:09AM +0100, Al Viro wrote:
> 
> > Umm...  Let's do it that way - fs/fhandle.c chunk of that commit is
> > trivially split off and the rest should not conflict at all.
> > 
> > Christian, would you mind throwing this on top of your vfs.pidfs?  I'm dropping
> > that part from my #work.misc commit...
> 
> Argh...  Sorry, no go - that chunk needs to go before the rest of conversion
> commit.  Hmm...
> 
> See vfs/vfs.git #vfs-6.17.fs_struct; that branches off your "reflow" commit
> and it merges clean with #vfs.all, AFAICS.
> 
> Are you OK with that variant?  I've no strong preferences re branchpoints,
> but some folks do - no idea if you have any policies in that respect.

Whatever makes collaboration here easier I'm happy to go with! Thanks
for jumping on this so quicly?

> If you don't have any problems with it, just merge it into #vfs.all
> and I'll drop that commit from #work.misc

Sure! Let me grab it.

