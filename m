Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34341139A19
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 20:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728738AbgAMTXU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 14:23:20 -0500
Received: from zeniv.linux.org.uk ([195.92.253.2]:55134 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgAMTXU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jan 2020 14:23:20 -0500
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ir5Ix-007UI4-II; Mon, 13 Jan 2020 19:23:15 +0000
Date:   Mon, 13 Jan 2020 19:23:15 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: BUG_ON hit in "reimplement path_mountpoint() with less magic"
 [Was: Re: linux-next: Tree for Jan 13]
Message-ID: <20200113192315.GS8904@ZenIV.linux.org.uk>
References: <20200113181457.209ab4a5@canb.auug.org.au>
 <14674349-1864-2d10-1f09-55b1fb834475@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14674349-1864-2d10-1f09-55b1fb834475@zx2c4.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 13, 2020 at 01:27:34PM -0500, Jason A. Donenfeld wrote:
> Hi Al,
> 
> Your "reimplement path_mountpoint() with less magic" commit is causing
> oopses on the linux-next tests running on https://build.wireguard.com/ .
> Here's one such crash with debug symbols:

Check if that persists with the version currently in #fixes (commit
7a955b7363b8).  It ought to be fixed there; quick check is to look
at fs/namei.c:path_mountpoint() in your tree - it should read
	if (!err && (nd->flags & LOOKUP_RCU))
		err = unlazy_walk(nd);
not
	if (!err)
		err = unlazy_walk(nd);
as in the broken variant.
