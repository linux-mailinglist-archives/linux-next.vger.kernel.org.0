Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D0F1E245A
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 16:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgEZOox (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 10:44:53 -0400
Received: from ms.lwn.net ([45.79.88.28]:36976 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727007AbgEZOow (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 May 2020 10:44:52 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 846722AE;
        Tue, 26 May 2020 14:44:52 +0000 (UTC)
Date:   Tue, 26 May 2020 08:44:51 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: Re: linux-next: Signed-off-by missing for commit in the jc_docs
 tree
Message-ID: <20200526084451.69a3bd45@lwn.net>
In-Reply-To: <20200526080122.5a91c78a@canb.auug.org.au>
References: <20200526080122.5a91c78a@canb.auug.org.au>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 26 May 2020 08:01:22 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Commit
> 
>   1fe411077207 ("Replace HTTP links with HTTPS ones: documentation")
> 
> is missing a Signed-off-by from its author.

Argh, I don't know how I missed that.  Thanks for catching it, it will be
fixed up.

jon
