Return-Path: <linux-next+bounces-5822-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E40D8A64BDA
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 12:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 186831885393
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 11:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339B4230BC9;
	Mon, 17 Mar 2025 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="EVq82bFL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924A5233127
	for <linux-next@vger.kernel.org>; Mon, 17 Mar 2025 11:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209791; cv=none; b=pg9wLN8rQOHPhDu6yMH6vcMBY1WBD+1vNdamvEGvdP5JEDiyyjo4wgNThGLOnec6ZwCInxE9nswkSHAj6sr9YdlaH0u5mgInsZbwe/Cg4lHNcSsqofOqIDJG5nXtoCdn3tP1A0ihv/P8lZLqth8rWqWISIaLs7aNLcZooKzkx5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209791; c=relaxed/simple;
	bh=fC1biwLTAdIi8RJqmE+ARw0t9iZUOkgq/ONQO22Lvy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k3wv3Hx4tbjEgA+c4UVOiZLYC9oHUNdcx0mhcDp+vV9j4KCzJeb0OTBZsb0AHn0wNMxxQ7eir3O0NX/sdHRV+X04VDnMp+CuQaE1qQJTK5qSKWxHJlRYchFifVaL5MDx49NvGxnYIu2P0FSWRDDxlDTg6Qud0pEPjQeOkafxGvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=EVq82bFL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1742209786;
	bh=zqbOzGR/S1NqZVeaOkKz/a3SBP5r2fF1Gtl6KlZ7yBc=;
	h=From:To:Cc:Subject:Date:From;
	b=EVq82bFLVWAwnFiYN0xCZZwDgOF0En0/B6KlIlF0AL70U0X3pAwg0xxKx62byv3ge
	 aMe1twjF8tvlPeanOl4hAHlpb1/ZelXSr6SlIfwTIhCwSrKJvfv0PlLnv9+PM23D6W
	 +Uq+vA1jF/DjtjhyJZAzsBy72YdW636f4Wu+2nmdrAATaKX5g8x/5ucNOYrYkXrOzx
	 ahnp4XaUQl4zwqgyghzPmR/X4I5Z6idikh8as2ab6ioTZQdagjMs2WRXT8X0+JFr1B
	 ipffAUWJh25DmOUXvjbNHhFnIW/gFii9V9Dh1tSZ2JxW9yQd1NA7yQ/ao+sJDeckIP
	 fwNVy8VQhP65w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGXLL2Y2Pz4x1t;
	Mon, 17 Mar 2025 22:09:46 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, maddy@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Please add powerpc topic/cxl branch to linux-next
Date: Mon, 17 Mar 2025 22:09:43 +1100
Message-ID: <87y0x3dibs.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi sfr,

Could you please add the topic/cxl branch of the powerpc tree to
linux-next for the next few weeks, it's targeted for the next merge
window.

  https://web.git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/cxl

It contains a topic branch of sorts to hold the cxl removal. It has a
few commits from the SCSI tree, up to and including the cxlflash
removal, then it merges powerpc/fixes to get a Documentation/ patch that
touches cxl, and then the cxl removal patch from Andrew.

The plan will be to send it to Linus after the powerpc and SCSI trees
have been merged, during the merge window.

cheers

