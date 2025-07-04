Return-Path: <linux-next+bounces-7354-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C265FAF8792
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 08:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F1053B2694
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 06:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1112139B5;
	Fri,  4 Jul 2025 06:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvEnSObd"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82296143C69;
	Fri,  4 Jul 2025 06:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751609130; cv=none; b=HdGLn9jTu3Qv9DsWS8ecW9Y4gr0V80U2k8pcRe2lVzCrcLAnSWXpxmKsJpMIcogBfR723MiWCHIyTMN/K9knIqUuHG0Zq9PTSX4aSasH+VkGEs37JVAAvEuT3cICT6MTi0CfYM8oqOY1buAU0SjNrc8kxDlI4LKRVdtKa/aG3mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751609130; c=relaxed/simple;
	bh=llJ6Ixj7Atm+JN8GCKw9TZo/vzaEZDwJyPYsadE69fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mu+CisNZ2cKqBYo+F6IgvH8u7uKRNgk7s7SHgn2iLp+6DQ7xdvrhiYSKrw83WwAQVaCQ/nTPRByQhVH5/Jzyu3zoAwPAG1GpoNd/WnAKwP7faPGppTLCNKusNg8m/qFygfwDhs/suDwlXeuSK0xoHCK+EGOpU4UaBBkS0bTX/Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvEnSObd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2525DC4CEE3;
	Fri,  4 Jul 2025 06:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751609130;
	bh=llJ6Ixj7Atm+JN8GCKw9TZo/vzaEZDwJyPYsadE69fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NvEnSObd/nzwQp/s6bpByuKNLRkDXhkBJC4SCbnbW4f0aLfUNqvMcGNsQs+gJYlbY
	 0MJvWDbV65HRXeKQZx+UUGml85dqlBOtWDNTcIHrNRhEu2VkcMedj3ynYc6S0ZumtF
	 rmgkE5i5PqkkZ7zir18jiJTWTQ2eSaf5qNicekYqknR5KMi1gwMWzxF/y6OlNhWEKy
	 IVEE96w2nCjaGetXcJcVHWR8TOUSOVl/lecT3FhGxO2P22WSMquqs9iZyf3Zl9PTRr
	 OIxmh23RO/r+cT9nAdZz3cPNP1MCSKnZXMJMLiiBlzkOLNQN2COFD8cUl8/jkV2yWI
	 xP+9C4VXvjqMQ==
Date: Thu, 3 Jul 2025 23:04:47 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: John Johansen <john.johansen@canonical.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linux Crypto List <linux-crypto@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the apparmor tree with the libcrypto
 tree
Message-ID: <20250704060447.GC4199@sol>
References: <20250704153630.0fb1e2f3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704153630.0fb1e2f3@canb.auug.org.au>

On Fri, Jul 04, 2025 at 03:36:30PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the apparmor tree got a conflict in:
> 
>   security/apparmor/crypto.c
> 
> between commit:
> 
>   ad7ca74e1c60 ("apparmor: use SHA-256 library API instead of crypto_shash API")
> 
> from the libcrypto tree and commit:
> 
>   e9ed1eb8f621 ("apparmor: use SHA-256 library API instead of crypto_shash API")
> 
> from the apparmor tree.
> 
> I fixed it up (I used the former version since it appears to be much
> newer) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

Thanks Stephen.  John, can you drop your version when you have a chance?

Thanks,

- Eric

