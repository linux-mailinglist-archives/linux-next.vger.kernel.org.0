Return-Path: <linux-next+bounces-7402-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8CAAFC5D2
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 10:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16F213AFB75
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 08:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466C62BE030;
	Tue,  8 Jul 2025 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2OpT3DI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBFA2BD5A3;
	Tue,  8 Jul 2025 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963736; cv=none; b=clWjtP16kCxHqYJOzwUAvB9dUe2WZqGNo+N9jcfQu4zbnadDPnffntRtad3+gR+BWAaZMJUckmU4kYZus5G3DGGiBoDXceYbNKfDfTUAgK4frr3hquqt+iDouvXpuoptiC9fcRUWqJK0U2kzNXHx/EI0l9Mc4TQd86CW0b6/nrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963736; c=relaxed/simple;
	bh=4AYQPld3RJywi2WjAV+L21S7FlQkVGY4AF06WeAkzl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDdmUeYK6Nu1ScjaNW9nyKnQLnX/dQgTpF1RnIzijdw843djyq6MUnMBGJtKfjHhWgG7kejUqkXnojwqninmGsj6zhL4830JvBkyQzofrQIXoIUOalN/qFUCMVUX8sobENWmGpaUmthnMRjhtyuJnzpLc2NCD41jK1BNUW6PP4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2OpT3DI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8F6C4CEED;
	Tue,  8 Jul 2025 08:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751963735;
	bh=4AYQPld3RJywi2WjAV+L21S7FlQkVGY4AF06WeAkzl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2OpT3DIIpK/z978JgAwvjFf9v4cNjnnTuUISFGgjK/1gLTqrMr8O6L/UhqCBPj9n
	 HfNPfciJfdi0WknNePqyAV1XqmJihslc6ie5aj/kMLrBYaKEUve9A80OHJ7E80yhOc
	 e1F6Wv2jjxJw1rhLCXbnNYiwHBvgNNIzDOLAVdl9xV0IU5rWK8XoFFsbJ14NS6GD/9
	 BqURAGXnjJxQcWesSx4EUtLN0MOo13XDkfWq6WFWYESdh3/XcLQ8J6e1lDrwv6LFu9
	 L1It24hwvAVcAsLHxO046t/US/2pFiiMBgJywG1PSUvBr2+naX/0qjpEuaIcYZszcS
	 xcFRZus9wET7g==
Date: Tue, 8 Jul 2025 10:35:31 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20250708-zocken-funkanstalt-9e658ddeca5c@brauner>
References: <20250708095118.58337fec@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708095118.58337fec@canb.auug.org.au>

On Tue, Jul 08, 2025 at 09:51:18AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the vfs-brauner-fixes tree as a different
> commit (but the same patch):
> 
>   8c0bcafc722c ("coredump: fix PIDFD_INFO_COREDUMP ioctl check")
> 
> This is commit
> 
>   830a9e37cfb2 ("coredump: fix PIDFD_INFO_COREDUMP ioctl check")
> 
> in te vfs-brauner-fixes tree.

Interesting. Are you merging vfs.fixes separately? Fwiw, I always merge
vfs.fixes into vfs.all. So if it's easier for you you can drop merging
vfs.fixes separately.

Christian

