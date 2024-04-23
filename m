Return-Path: <linux-next+bounces-2023-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAC78AE8CA
	for <lists+linux-next@lfdr.de>; Tue, 23 Apr 2024 15:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAC36B21FDA
	for <lists+linux-next@lfdr.de>; Tue, 23 Apr 2024 13:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71719135A4A;
	Tue, 23 Apr 2024 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="gxbDmDtH"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873C5135414
	for <linux-next@vger.kernel.org>; Tue, 23 Apr 2024 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713880612; cv=none; b=ndnP6YTXjZRV5Zn5V5F/EKGZ0yUIQYYtb0whNhYk2PAS5ZQ7yweXrKtUkusZbW4ubym5UmNSDRPExRqD/ODaJY3g1pXE4DkfK4HaTFOy08oX+bZ5OhbxIEvoZpQ+eZOVFT5BBbC8PFCrq7QNoTDNEInsBrEBCWlJLH3yGqq53iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713880612; c=relaxed/simple;
	bh=CHtOdwbj0E1GvwNkXmOfZvz8pKIWj92NEKclpPh6Nas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dgRCs2I/6EitFns3hmAlXZZ0YU3QOgv0MTfOavlUzFLhupyZS3ntMuzgSC9eXm2wXa3yIvEH+9bW9a8n4yRIN8aQUbYeizb8d6bahaGcNUw1AbJ7o/b4cUHb2fDCO1I2ko/JN3mCreNGHf8poRGxobBIxSJR+oNaS0Hdzc29OTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=gxbDmDtH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713880607;
	bh=CHtOdwbj0E1GvwNkXmOfZvz8pKIWj92NEKclpPh6Nas=;
	h=From:To:Cc:Subject:Date:From;
	b=gxbDmDtHv8CHQGC16MwRvxY5H/eQJEZ1uUUgkCA/31tRoQMst3mllrY1L96An4W8z
	 ZgjxurB7hIx+CtkxSJDlLfsLTdn/P1yplRiwmzmxV9JwOG9JZ2/WmxhqOH01VHAZ2T
	 Xu1m+u1oHdw7sgbgSBu7lL9GAVZP/Y3beq5ooL3aox888yI+yo1X8shY49JKWqEkZ7
	 +gSfoW3JSxL9xF9Ch0lFhJROyiJy741/A4jxtn1EDV6AQhd0gHlWiRWN1YVB1XNyMl
	 9Hvi3NtvspG1aywuM84oL3s6QPy2ihc8nuZPuhlVhnsvv8YVLxqoEiaxt7RaGclVK6
	 ioTNNK6Xg5/Vw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VP3ZP3GqJz4wby;
	Tue, 23 Apr 2024 23:56:45 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, kexec@lists.infradead.org,
 sourabhjain@linux.ibm.com, bhe@redhat.com 
Subject: Please add powerpc topic/kdump-hotplug branch to linux-next
Date: Tue, 23 Apr 2024 23:56:42 +1000
Message-ID: <87bk60ji79.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Stephen,

Can you please add the topic/kdump-hotplug branch of the powerpc tree to
linux-next. It contains a series that touches generic kexec code as well
as x86 and powerpc code.

The hope is to have to get it merged for v6.10, so it should go along
with the powerpc next branch in the merge order.

https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/kdump-hotplug

cheers

