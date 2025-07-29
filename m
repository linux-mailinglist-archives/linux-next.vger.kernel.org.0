Return-Path: <linux-next+bounces-7744-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3A3B149AF
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 10:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEDA418A1654
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 08:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2F926B0B6;
	Tue, 29 Jul 2025 08:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvOCthVP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A579C130AC8;
	Tue, 29 Jul 2025 08:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753776141; cv=none; b=II3C1adI4SJKxO/pDP9ng6d0apj/QnXJOc+R05IdYxK4vY/COHfJPEGSYZ1JvJ/nCDMpqyKwjAneoszxJ5BMOlGtfECyAcLu2eUDkx8Ne2eFae3eqE0uL7m4LZcFSxF3lrlDX5mcPLtvkvdvJJUcVbseL6p9ZEGQk+Ga6Xnk8Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753776141; c=relaxed/simple;
	bh=ZmSqoSQuUbPwJKP9gq7L9+fuw/CWVaENt5XFi3mZ4Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWtRrnX4j4I7CpUmJiBKItniYUvU7HKyXGgWLWu0zk6hD6uWtuKJUalTQbgm+Hvwy7bbFLmPICsdqCRLgPBYw+I7cXyO1kVeLgbBT73s4Me9LdefyPYKtsnjXSRNjxXkUjb7Cj269HVro3ukMkr1I5muf540P2fmaC+3cN1mg1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvOCthVP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251FFC4CEEF;
	Tue, 29 Jul 2025 08:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753776141;
	bh=ZmSqoSQuUbPwJKP9gq7L9+fuw/CWVaENt5XFi3mZ4Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvOCthVPjRLcYwRj3lbsoogeDZltV+LZUGB6HsJ5RCbec41YlSYx5F7r5Ft9QygPi
	 9meJqNSFMPJSefQHPBxl80Kjb4e913myLJodPCdQmKqtS5lOItdE0WJ3Ao/U0Wvqt9
	 l1ibj+XuN26YkzYRW6spDCjwRHdmWTwLvZ8EON+mJSDwApV2ZMkj0FWZbL6DmxNEJI
	 On7/sEl6XMBHdlvzRQVCO1bzFlU+MrHpdv3iK8gEF9v9NCP6uZ841JlWsVB+NESVjU
	 F67Bf6oys/vkoMLffnhmO3QlNDYrLcffEL0N8554Nmvoo86O3feoSEZ+XCctVxHlG/
	 m9P+SVceETI+Q==
Date: Tue, 29 Jul 2025 11:02:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the paulmck tree with the
 mm-nonmm-unstable tree
Message-ID: <aIiABxMGqYg2bGZ5@kernel.org>
References: <20250729104245.6be6957a@canb.auug.org.au>
 <e8191e3c-a3cf-4926-95cd-be3e3db4b86c@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8191e3c-a3cf-4926-95cd-be3e3db4b86c@paulmck-laptop>

Hi Stephen,

On Mon, Jul 28, 2025 at 09:28:08PM -0700, Paul E. McKenney wrote:
> On Tue, Jul 29, 2025 at 10:42:45AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the paulmck tree got a conflict in:
> > 
> >   lib/Kconfig.debug
> > 
> > between commit:
> > 
> >   c2d288f7ab13 ("kho: add test for kexec handover")
> > 
> > from the mm-nonmm-unstable tree and commit:
> > 
> >   d19e9fa61f60 ("lib: Add trivial kunit test for ratelimit")
> > 
> > from the paulmck tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Thank you, and this looks plausible to me.
> 
> There is an extra blank line, but worse things could happen.

Yeah, what Paul said :)

> 							Thanx, Paul
> 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 

-- 
Sincerely yours,
Mike.

