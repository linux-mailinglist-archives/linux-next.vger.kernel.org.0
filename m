Return-Path: <linux-next+bounces-8622-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25778BEBD1B
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 23:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8F6D6285E3
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 21:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB15265CAD;
	Fri, 17 Oct 2025 21:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GdLvCsIh"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C3419ABC6;
	Fri, 17 Oct 2025 21:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760736896; cv=none; b=FB+QhfvfReQ0RGN2s3nlJNIvv2DIG05hIfWaD33UMua9lTlqgz5Ankw28afnd+mRt05GHymlzBs2UaFqrH9Qdyf8hfskTgvQXVTXipMEtYzDFu/LoTqadmOL8OELR/MXDPp5OizKy9BLz2f/73QQQgpM6VhlCamuwA6bt3+Lym4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760736896; c=relaxed/simple;
	bh=iwPzv8SqY16yQkSLGOkVZKof4DlBtEdJgYXEwqfjIAE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WywZlkF55M73RCLvmThVd3CHMh33nHYUEJOj9lvFm2/TfDER8Q9R57uUhfCv5kv5N45InQuYi1BtZRgL57vFcsBdBYi9v5iWGEJgSXJuUWbhRNsMgp8VJpnufau4Gw+VRzLS+dpAGa5IjvUDQBVML5PJP6EyrSVZYjizhIcEkRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GdLvCsIh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FB7C4CEE7;
	Fri, 17 Oct 2025 21:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1760736896;
	bh=iwPzv8SqY16yQkSLGOkVZKof4DlBtEdJgYXEwqfjIAE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GdLvCsIho3XclYFzpp6oB+yPpPb40TMeMlfUlFFOCFFOMk649ZKu/MDl03vw0teOI
	 kLw5tDIXF+XnU4M+B4AV9pTXnbc/y9kEi7aYr5e6DwTpbGv6jV9z+y70jClJo2Gliu
	 /pDqNy8ZPo/HEDNPdSqjfNVSetT9D5l6Mki6CiRE=
Date: Fri, 17 Oct 2025 14:34:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Wei Yang
 <richard.weiyang@gmail.com>, David Hildenbrand <david@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable
 tree
Message-Id: <20251017143455.712b94e1cfa744fa7a46215e@linux-foundation.org>
In-Reply-To: <aPJD4ANRWUDVDqKc@sirena.org.uk>
References: <aPJD4ANRWUDVDqKc@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Oct 2025 14:25:52 +0100 Mark Brown <broonie@kernel.org> wrote:

> After merging the mm-nonmm-unstable tree, today's linux-next build
> (x86 allmodconfig) failed like this:
> 
> In file included from /tmp/next/build/samples/vfs/test-list-all-mounts.c:11:
> /tmp/next/build/samples/vfs/../../tools/testing/selftests/pidfd/pidfd.h:28:10: fatal error: kselftest.h: No such file or directory
>    28 | #include "kselftest.h"
>       |          ^~~~~~~~~~~~~

Well that:

#include "../../tools/testing/selftests/pidfd/pidfd.h"

was a strange thing to do.

I'll toss this on top:

--- a/samples/vfs/Makefile~selftests-complete-kselftest-include-centralization-fix
+++ a/samples/vfs/Makefile
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 userprogs-always-y += test-fsmount test-statx mountinfo test-list-all-mounts
 
+CFLAGS += -I../../tools/testing/selftests
+
 userccflags += -I usr/include
_

but there's probably a better way...

