Return-Path: <linux-next+bounces-5424-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7674A32989
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 16:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D0C31882569
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 15:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE628211261;
	Wed, 12 Feb 2025 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="I9P9KuuA"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14F4271800;
	Wed, 12 Feb 2025 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739372965; cv=none; b=RcPMgCJgzbZu1N20tnrkzmhkAsx9Oy9Dd4MhZiNq+6sZcr9y1lXJ3iH0Z0eAo+xHOh0FDF79CsFJnyjIj7WiZ/hnCPJwdOxcDWyNoOAnN1DdWQf1rOoXCXnY9yEGo0uqJeO2Oy9zSGkk6LxhzdY0E5RhJowN9NBRUVFVRaAf/Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739372965; c=relaxed/simple;
	bh=s3eO8v8XSBK+TZeF1RJzMOrNTjuDMAawnfOErWRYpDI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uhY3/pnvExG+WvPfdNEG4GgRzS2/IAqb2062cPMrejpk6lPOiJ6cT9Up76nelZJGihuxH8XtQCk3SF7hJIUcnwCkVTkyO1r1qgVXAFM6Rlp4Ifb2wOQUf1XRTgsfroUhucbzmoluMcamR/yWW0rqCUKLlBJNZ9eM8nyYyNS3xXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=I9P9KuuA; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EA9E2411AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739372963; bh=s3eO8v8XSBK+TZeF1RJzMOrNTjuDMAawnfOErWRYpDI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I9P9KuuA2jhcYtzD42L5khNM19/Yyp/bOukIlGuw0/J5h77rziXgyvFlaHsclyj61
	 1q+GiioqmdDuX83TcGg6cM9Ud3w0Ab4J6n48WWCjmU1zVbjweyufFICATBNEA6y2LL
	 yzSgpLYkmaAk0wbzCTw00redyWC6VcnzX6QBHk+LUtm0ipN5XyP8OQYcUgT7AJHJV6
	 vfbBRUnZ38MTyTWe7b4GlExDE1nZZ4/JrPgqhMrHvzs0EP9W46kHQKCpMK4W5OouOo
	 GdpqkXC/7fUIZz+rD848a4PjFYaFRArCdzq9naNkL/Zc6Su293uln2YHG7dcN6rFo3
	 tn6Q32AKuJRMw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EA9E2411AD;
	Wed, 12 Feb 2025 15:09:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the jc_docs tree
In-Reply-To: <20250212155253.5bf0513a@canb.auug.org.au>
References: <20250212155253.5bf0513a@canb.auug.org.au>
Date: Wed, 12 Feb 2025 08:09:22 -0700
Message-ID: <871pw3urml.fsf@trenco.lwn.net>
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
> After merging the jc_docs tree, today's linux-next build (htmldocs)
> produced these warnings:
>
> WARNING: /sys/devices/system/cpu/cpuX/topology/physical_package_id is defined 2 times: Documentation/ABI/stable/sysfs-devices-system-cpu:27; Documentation/ABI/testing/sysfs-devices-system-cpu:70
> WARNING: /sys/devices/system/cpu/cpuX/topology/ppin is defined 2 times: Documentation/ABI/stable/sysfs-devices-system-cpu:89; Documentation/ABI/testing/sysfs-devices-system-cpu:70
>
> I am not sure what introduced these warnings, but I am guessing Mauro's
> changes have exposed them - the two Documentation files above have not
> changed since my last build.

Exactly - the situation has been there for who knows how long, it's just
that we're hearing about it now.

Thanks,

jon

