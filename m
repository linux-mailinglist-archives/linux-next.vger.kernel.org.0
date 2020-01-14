Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09783139DF1
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2020 01:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729101AbgANASr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 19:18:47 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:46216 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728865AbgANASr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jan 2020 19:18:47 -0500
Received: from callcc.thunk.org (guestnat-104-133-0-111.corp.google.com [104.133.0.111] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 00E0IWQ7000877
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Jan 2020 19:18:33 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 8AA984207DF; Mon, 13 Jan 2020 19:18:32 -0500 (EST)
Date:   Mon, 13 Jan 2020 19:18:32 -0500
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qian Cai <cai@lca.pw>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the random tree
Message-ID: <20200114001832.GP76141@mit.edu>
References: <20200108113953.1a92a90f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108113953.1a92a90f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 08, 2020 at 11:39:53AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   1b710b1b10ef ("char/random: silence a lockdep splat with printk()")
> 
> is missing a Signed-off-by from its author.

Sergey, can you confirm that you intended to add a Signed-off-by: for
this patch?

Thanks!!

						- Ted
