Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF8FFD447
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 06:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfKOF3q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 00:29:46 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34531 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727206AbfKOF3p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Nov 2019 00:29:45 -0500
Received: by mail-pl1-f193.google.com with SMTP id h13so3864357plr.1
        for <linux-next@vger.kernel.org>; Thu, 14 Nov 2019 21:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XZkN9+kUoRQ9uBZoFuptITant6xYc3cAxZ6x4hNFsbo=;
        b=iQN/SupoAsrzY7KzqYS/8b7Nh+LRIr7OKepsE8dJWaGnSlUyhFPZHb26dLTpLrr+6p
         sF/2wg/5maFWjGeOZhnS/XffzFqCjaHWTNZw0oZGOWdIzFsZTnO9kp7ZPiNHcVVkJHlB
         THDwb3TiQCZLCUgGphFIpJztBTupkHKA28yiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XZkN9+kUoRQ9uBZoFuptITant6xYc3cAxZ6x4hNFsbo=;
        b=LbKkHB2zsmO4nXS/VWcXCft9Uh0ujq239BKSoSJUH51WUvvotncZjjFgr1NW0PyKVv
         FAjIMZapJxEGZiowPpVZIQfE0M92eb7H/8m5J+70PfbLCezJYvEwHAusnk1LynV1wOtA
         aMvF/hkval92X/rl15tg1admQ2S+x38slAhOfr11391Ur3Glip1BiuGKj0tqdDFjZrlF
         YkL7LWXsiVCbB61b5a6Z915EgeE3DyZ/6dV/Eu1RO/H89m7PnTx9Jqdtt/XdVvZxhUcW
         Anj+hwIygQOW9a0LPfmq4V/YIhuUjZHhOk3erQbNMyOWqt6DyWBHZa3tZiDZiEVYis/8
         e/TA==
X-Gm-Message-State: APjAAAVVbDKG03BQ2g2KRfRqTyuf06YbEgTTnvm/Oe0tVt3WMvYegOAL
        gIddcREjezuZtlYoNvixCz+pHwMZ8U0=
X-Google-Smtp-Source: APXvYqySCijUwLCxn004BCwqcRR5lBczZ5d0p7V7o4tF6Lm3ryz9dIHdgV+WjiZvVI177tTfHyUpGg==
X-Received: by 2002:a17:902:8690:: with SMTP id g16mr13918122plo.194.1573795785008;
        Thu, 14 Nov 2019 21:29:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h3sm6742740pji.16.2019.11.14.21.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 21:29:42 -0800 (PST)
Date:   Thu, 14 Nov 2019 10:43:09 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jan Kara <jack@suse.cz>
Cc:     Matthew Bobrowski <mbobrowski@mbobrowski.org>,
        Theodore Ts'o <tytso@mit.edu>,
        Ritesh Harjani <riteshh@linux.ibm.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: ext4_iomap_alloc(): Integer handling issues
Message-ID: <201911141042.5B8B2BC4AB@keescook>
References: <201911111735.1F45BB0B4@keescook>
 <20191112072239.GB15488@bobrowski>
 <20191112110004.GF1241@quack2.suse.cz>
 <201911121256.647DA73508@keescook>
 <20191112212846.GA29863@bobrowski>
 <201911121414.ECAA926@keescook>
 <20191113093754.GB6367@quack2.suse.cz>
 <201911131036.2E3F280B9@keescook>
 <20191114085812.GB28486@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191114085812.GB28486@quack2.suse.cz>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 14, 2019 at 09:58:12AM +0100, Jan Kara wrote:
> On Wed 13-11-19 10:38:43, Kees Cook wrote:
> > On Wed, Nov 13, 2019 at 10:37:54AM +0100, Jan Kara wrote:
> > > Well, I don't think we want to clutter various places in the code with
> > > checks that inode->i_blkbits (which is what blkbits actually is) is what we
> > > expect. inode->i_blkbits is initialized in fs/inode.c:inode_init_always()
> > > from sb->s_blocksize_bits and never changed. sb->s_blocksize_bits gets set
> > > through sb_set_blocksize().  Now it would make sense to assert in
> > > sb_set_blocksize() that block size is in the range we expect it (currently
> > > there's just a comment there). But then I suspect that Coverity won't be
> > > able to carry over the limits as far as into ext4_iomap_alloc() code...
> > > Kees?
> > 
> > Yeah, I'm not sure it's capabilities in this regard. It's still a bit of a
> > black box. :) I just tend to lean toward adding asserts to code-document
> > value range expectations. Perhaps add the check in sb_set_blocksize()
> > just because it's a decent thing to test, and if Coverity doesn't notice,
> > that's okay -- my goal is to improve the kernel which may not always
> > reduce the static checker noise. :)
> 
> Now I've noticed that set_blocksize() called from sb_set_blocksize()
> already has these checks. So there's nothing to add. Just Coverity is not
> able to carry over those limits that far...

Okay, cool. I'll mark it as such. Thanks!

-- 
Kees Cook
