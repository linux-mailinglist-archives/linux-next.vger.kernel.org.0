Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812252E8C8F
	for <lists+linux-next@lfdr.de>; Sun,  3 Jan 2021 15:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbhACOTk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 Jan 2021 09:19:40 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51704 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbhACOTk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 3 Jan 2021 09:19:40 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7E6921F44215;
        Sun,  3 Jan 2021 14:18:58 +0000 (GMT)
Date:   Sun, 3 Jan 2021 15:18:55 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: linux-next: error while fetching the i3c-fixes tree
Message-ID: <20210103151855.5d25ee80@collabora.com>
In-Reply-To: <20210103223217.478bc238@canb.auug.org.au>
References: <20210103223217.478bc238@canb.auug.org.au>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+Alexandre, the new I3C maintainer. You should probably flag him as the
person to contact if you have problem with the I3C tree in the future.

Hi Stephen,

On Sun, 3 Jan 2021 22:32:17 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Fetching the i3c-fixes tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git#master)
> produces this error:
> 
> fatal: couldn't find remote ref refs/heads/master
> 
> Should I maybe use the i3c/fixes branch instead?

Oops, I thought you were using that branch already. I guess I never
noticed because I didn't use the fixes branch much and kept the master
one around.

Sorry for the inconvenience.

Regards,

Boris

