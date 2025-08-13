Return-Path: <linux-next+bounces-7934-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17089B244AF
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 10:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 542A11A2469A
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 08:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C222E9EAF;
	Wed, 13 Aug 2025 08:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sUtci6My"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAAB2C3252;
	Wed, 13 Aug 2025 08:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755075015; cv=none; b=AQMrx3HYUjrXOVuQB/v6ODMkgW68STOxUJ6kc7mHsQOZxtPHuGcZyKQ05m8UkskplmxprcZzDkXVM3V9g2omni6D6yJoLDHGtwMdH2HvgxC16ljW56LV2QuM9ajTHUhzJL7/O9JkCFZfe5hjoxeUjJZYPu2H5pXPx8uPNDTlPz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755075015; c=relaxed/simple;
	bh=HpSkLFEcgW7BuZHgarJdSFQxecSBz2gnVw9LpRrpxms=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ekG0XDtaA9hVZnMoBa/NmUallg+Fdtrz/wA8YoiwzEh+337Ia1nKkRfcl5acZCoQ1HHUD/SixCzars+G8IWZdoxyPldCl6AoLcGCrfbpq86A+K1O4bD4yO8O0pnWo/JIqdXngECyYUHqOEWY5ziHIl/d32yp2bGa/PpXA+7I+HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sUtci6My; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FB9C4CEEB;
	Wed, 13 Aug 2025 08:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755075015;
	bh=HpSkLFEcgW7BuZHgarJdSFQxecSBz2gnVw9LpRrpxms=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=sUtci6My47KSeL+0WBRNsXEy/dU9q4UPzoGOvQexfRZxsBOArTdeR6P4DWlRS9h0i
	 0uT5e/gSk86y/Yj7yyiy/jpAN3vNKkWWNEh1E/wMx+m2EwL9PUkINEyuR/7j0VYbYD
	 aMrRnk04aXPt+W/bEJvv/mo6dqauVlY4hEPfxH5HpxW1ar7QNszFo8nWfQ86sxSjTs
	 GTJ2Yfv9dy4OVZxMCX/o8zwGUdeYvw4pna0/hc/I2CTAYQSeYx/DnmpK6zkPoBXC/H
	 eZAMOUvop2N+QczJpF9z+wfQioOwdrDpsQFhYT7dbwdRsI7J5P78A0KoANXT1AUph/
	 sLAIxmztCY4pQ==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 10:50:11 +0200
Message-Id: <DC1661RBEB1Q.1Y748EK7YML1Y@kernel.org>
Subject: Re: linux-next: manual merge of the mm-unstable tree with the
 drm-misc-fixes tree
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Vitaly Wool" <vitaly.wool@konsulko.se>, "Intel
 Graphics" <intel-gfx@lists.freedesktop.org>, "DRI"
 <dri-devel@lists.freedesktop.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250813111151.6a261ca1@canb.auug.org.au>
In-Reply-To: <20250813111151.6a261ca1@canb.auug.org.au>

On Wed Aug 13, 2025 at 3:11 AM CEST, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the mm-unstable tree got a conflict in:
>
>   rust/kernel/alloc/allocator.rs
>
> between commit:
>
>   fde578c86281 ("rust: alloc: replace aligned_size() with Kmalloc::aligne=
d_layout()")
>
> from the drm-misc-fixes tree and commit:
>
>   cda097b07bce ("rust: support large alignments in allocations")
>
> from the mm-unstable tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, the resolution looks good!

