Return-Path: <linux-next+bounces-4784-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB17B9C800B
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 02:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51DD6B23580
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 01:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426D434545;
	Thu, 14 Nov 2024 01:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="WJAG5wET"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848662EAE4;
	Thu, 14 Nov 2024 01:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731548092; cv=none; b=F9UjLjlYI0YMIkf34xvWufMsSLsZBhLQ8KBTImrU/1eIxJgHIGCxMeN7FH68VDavYTEq4Ryt9rna/qzFshAkq9vvBZqZfx+4YNylwapv7sJgCFivAw1k2PxkOqr/S7yFO3IfW+16ug583cbwr/CguYba78rR6kecH9BKhPABiWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731548092; c=relaxed/simple;
	bh=6yqD2Hbus4Twk+cEkwJ1hq3IOGiHTa+yRFMjd4NA9RE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PIvKKZNbVP8/o3PVGSlciPmYJAE/NfU7xLP3EuG8FzyXrehMS2prDSYCfv3IClrk/iPB4ghVGT9OR7qpH6yBs97jwyGC/GFYNVdmgX/FtH/GtsxqtutWWSrPxyFw529fgqB3vkQgVAT3/ZA02dEXS6Dfu3yKd7j38Ax4F2rG/t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=WJAG5wET; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731548083;
	bh=XePRSe12+tUbovwm+3QKmvMeZZPE4Vjl3ztgCivD9+g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WJAG5wETwD7gPDu7kNNN363h9DIdReyGhf7TQDrKVwpt0P69bLaHjVLJ6GH4v5jhl
	 XMI51C409ULCNLvvvl8I1LJj+l8xDPMembZsox5dtrg0w0UjRU1mLvASyA/ueEZ1db
	 Ts0PzXSs9pENeEHLqSug7D/RtQPnCX/4fMcJHqk8zuFBXNWUPqKcOLNMaTT0Yry+co
	 VpuSCHFVOYXvxLe/QaiP0hPI/Wrmv09sga23jyurBLep5ILTHzCZt+/oDr0OyJqEu/
	 g9pMVSu+AUtMb8d5xDm5VeqMhRZFlFvRaCxGhxNEXZYJrLL0EFg5H4rnQaPFmAC1vW
	 RZKRmHBoXT9xA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XpjPb4z4wz4x04;
	Thu, 14 Nov 2024 12:34:43 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Masahiro Yamada
 <masahiroy@kernel.org>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: manual merge of the powerpc tree with the kbuild tree
In-Reply-To: <20241113095228.4ac96776@canb.auug.org.au>
References: <20241113095228.4ac96776@canb.auug.org.au>
Date: Thu, 14 Nov 2024 12:34:45 +1100
Message-ID: <87bjyivbre.fsf@mpe.ellerman.id.au>
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
> Today's linux-next merge of the powerpc tree got a conflict in:
>
>   arch/powerpc/Makefile
>
> between commit:
>
>   de51342c5157 ("kbuild: add $(objtree)/ prefix to some in-kernel build artifacts")
>
> from the kbuild tree and commit:
>
>   bee08a9e6ab0 ("powerpc: Adjust adding stack protector flags to KBUILD_CLAGS for clang")
>
> from the powerpc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Ack.

cheers

