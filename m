Return-Path: <linux-next+bounces-269-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE826808833
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 13:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E09EB21A70
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 12:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B153D0A4;
	Thu,  7 Dec 2023 12:44:48 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587E910CA;
	Thu,  7 Dec 2023 04:44:41 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVw21z7z4xSY;
	Thu,  7 Dec 2023 23:44:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
In-Reply-To: <20231127132809.45c2b398@canb.auug.org.au>
References: <20231127132809.45c2b398@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <170195271163.2310221.9540275310397413259.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:38:31 +1100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Mon, 27 Nov 2023 13:28:09 +1100, Stephen Rothwell wrote:
> After merging the mm tree, today's linux-next build (powerpc64
> allnoconfig) failed like this:
> 
> arch/powerpc/mm/book3s64/pgtable.c:557:5: error: no previous prototype for 'pmd_move_must_withdraw' [-Werror=missing-prototypes]
>   557 | int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
>       |     ^~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> [...]

Applied to powerpc/next.

[1/1] linux-next: build failure after merge of the mm tree
      https://git.kernel.org/powerpc/c/0d555b57ee660d8a871781c0eebf006e855e918d

cheers

