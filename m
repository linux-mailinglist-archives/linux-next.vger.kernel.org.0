Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474E038C8DC
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 16:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236461AbhEUODQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 May 2021 10:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232587AbhEUODP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 May 2021 10:03:15 -0400
Received: from fieldses.org (fieldses.org [IPv6:2600:3c00:e000:2f7::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699F5C061574;
        Fri, 21 May 2021 07:01:52 -0700 (PDT)
Received: by fieldses.org (Postfix, from userid 2815)
        id 70D1164E8; Fri, 21 May 2021 10:01:51 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 70D1164E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fieldses.org;
        s=default; t=1621605711;
        bh=1/Aa6tGcfRlx1OajDMLRZKjRRqKDyYsBIASgiY6i/2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kjYVCNhysLus+gq0rnhEaruEwamgFiZFg8oh/9YNwgrc4UVjVaL4oL0jC32K+MtZ1
         lFnIzDgXLnvLlY/2JnAyeKR/gEKko3hmVjIIi/Hc1ZRMqT+gem4kblLR8XvI3R7fnl
         BsZqx41AauV+b0LlIWpUfs9eWGliB8fLprM72wXU=
Date:   Fri, 21 May 2021 10:01:51 -0400
From:   "J. Bruce Fields" <bfields@fieldses.org>
To:     "Kornievskaia, Olga" <Olga.Kornievskaia@netapp.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the nfsd tree
Message-ID: <20210521140151.GB30314@fieldses.org>
References: <20210521080416.45f06cb8@canb.auug.org.au>
 <20210521135051.GA30314@fieldses.org>
 <EC2C4D09-8C52-4DDE-B21F-311219237DE4@netapp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <EC2C4D09-8C52-4DDE-B21F-311219237DE4@netapp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 21, 2021 at 01:55:03PM +0000, Kornievskaia, Olga wrote:
> 
> 
> ﻿On 5/21/21, 9:51 AM, "J. Bruce Fields" <bfields@fieldses.org> wrote:
> 
>     NetApp Security WARNING: This is an external email. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> 
> 
>     On Fri, May 21, 2021 at 08:04:16AM +1000, Stephen Rothwell wrote:
>     > Hi all,
>     >
>     > Commit
>     >
>     >   ff78b9442926 ("NFSD add vfs_fsync after async copy is done")
>     >
>     > is missing a Signed-off-by from its author.
> 
>     Olga, can I add
> 
>             Signed-off-by: Olga Kornievskaia <kolga@netapp.com>
> 
>     ?
> 
> [olga] But the post/patch contains that?

Whoops, you're right.

> I don’t understand. Even attached file has it. I think what trips
> these system is that I use gmail to submit patches but signed-off-by
> is from my netapp email. Unfortunately, I have no way of submitting
> them from netapp. So the patch is correct the automated system is
> let's say is "too strict"?

I'm using "git am -s" and that's not picking up your Signed-off-by line
for some reason.  Looking at the mail....

Oh, I see, your mail looked in part like:

  However, in order to save the client doing a COMMIT as a separate
  rpc, the server can reply back with NFS_FILE_SYNC copy. This patch
  proposed to add vfs_fsync() call at the end of the async copy.
  
  --- v2: moved the committed argument into the nfsd4_copy structure
  
  Signed-off-by: Olga Kornievskaia <kolga@netapp.com>
  ---
   fs/nfsd/nfs4proc.c | 14 +++++++++++++-
    fs/nfsd/xdr4.h     |  1 +
     2 files changed, 14 insertions(+), 1 deletion(-)

But git uses "---" to mark the end of the changelog.  That allows you to
include the diffstat, or any other notes that you want included in the
mail but not in the final changelog.

That "v2:" note is probably also something that belongs in the mail but
not the changelog, so in future if you just move that kind of thing to
after the Signed-off-by line, git-am will do the right thing.

--b.
