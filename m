Return-Path: <linux-next+bounces-7935-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D96B24500
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 11:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 445C316FAF1
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 09:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FEA2EF678;
	Wed, 13 Aug 2025 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VW4HIn/L"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1562EE5FD;
	Wed, 13 Aug 2025 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755076050; cv=none; b=o7hWoGcZ5cv1yvQ9ZwpnXsGomPJ0Fzr+rbh9WNhmjztCxy4o9LK49PoyQfscdgQSQ9G/FvkzIwayBvwFtWHnC7h1gmKnZN8PY7193lJkGA+8UoTdqB2u1x08RVEv+uzKUjiHIDfGNxQFK4pIanPGJGIPZTSc5NZg5TuMuEGTKKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755076050; c=relaxed/simple;
	bh=Xbf1FDxbQ/qRvhhN1Z5oTn4sAbhr4F55+ThZxmjLwko=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=IhXGGiPLuyvGJefT/+0tV6Wu1uJugqSy/KVjQPnaXAMlyHaedXJEYySSUlUJjHYAbI0JZpZr6gltRGaX41Z9hLhXVdOycXHN83ARt9tVnWflLkzWib8E0WmZZzv5rUuF1HYYR3uOosx0ot9ZREn6m7EXccaaheDX5Ex2xJGk3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VW4HIn/L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5893CC4CEF5;
	Wed, 13 Aug 2025 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755076050;
	bh=Xbf1FDxbQ/qRvhhN1Z5oTn4sAbhr4F55+ThZxmjLwko=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=VW4HIn/Lpne9MfGqe54rPEZ12mib5gy4liVyd+esatGj5PHpXoyIJKRNEHjzRs5kO
	 ic3RMQhvDr2JIdvnXTT1SuymXML353qI237vplRz3dDGvOozjT/vEpomSjzRtSUGP9
	 xOgRY6njZiAse8mBtnxmoOtOIMG9Lzbw1JNbegnbjpqMmutJxeuBVlFZ3C/gZ6ojCQ
	 CG3sPPvmiM3YxIxZTJO3gLRJ4ZFUsPlu3RaNZj4shiXrg9hlB8WqwKluTi5vLJFJRQ
	 F/3T0sWgY88bUdXnwL3XJrafxYHhczO/qsK38T63TF6B9HLfA/rlogSGaqmW0yIRWG
	 /KEcg3hCmbntw==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 11:07:26 +0200
Message-Id: <DC16J93QUQGV.4Z8STIPX6MGM@kernel.org>
Subject: Re: linux-next: manual merge of the mm-unstable tree with the
 drm-misc-fixes tree
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Vitaly Wool" <vitaly.wool@konsulko.se>, "Intel
 Graphics" <intel-gfx@lists.freedesktop.org>, "DRI"
 <dri-devel@lists.freedesktop.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
To: "Andrew Morton" <akpm@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250813111151.6a261ca1@canb.auug.org.au>
 <20250812205946.2db0d8645f3c2ed6c8828ae2@linux-foundation.org>
In-Reply-To: <20250812205946.2db0d8645f3c2ed6c8828ae2@linux-foundation.org>

On Wed Aug 13, 2025 at 5:59 AM CEST, Andrew Morton wrote:
> Thanks.
>
> Well that's messy.

I think it's not too bad, the changes are just too close to each other -- n=
o
semantic conflict.

As a general heads-up, Rust code is a bit more prone to conflicts.

On one hand this is due to the more powerful type system and components of
different subsystems being a bit closer connected to each other to provide
additional safety guarantees.

On the other hand, there's simply a lot of foundational work going on in
parallel.

For the Rust parts that are maintained under your mm tree, I think it shoul=
d
generally stay well within limits though.

> Is it intended that the containing series ("Alloc and drm::Device
> fixes") be merged into 6.17-rcX?

Yes, not sure if it will be in -rc2 already, but should be in -rc3. So, the
conflict in -next should vanish in case you backmerge the corresponding -rc=
.

