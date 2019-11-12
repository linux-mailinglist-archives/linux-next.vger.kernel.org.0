Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54E5AF9B57
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 21:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfKLU6O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 15:58:14 -0500
Received: from mail-pl1-f178.google.com ([209.85.214.178]:44447 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbfKLU6O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 15:58:14 -0500
Received: by mail-pl1-f178.google.com with SMTP id az9so23653plb.11
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 12:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Zm96awOTyQdBAQ39ZmbTLB2bJOaShzPfIo6BaQ8vXXU=;
        b=nQrL2hxwmv/b/wenTwGmgQwmNlfhGwSK8Jc8Y8rlO/LI1FWaHOS7Cp5Z90dN+Uvtzi
         1PP4WPTuf+rqAJRMwFOHITprsZ9dbbpvYtgTDQByxIngj8D4nybPoLahzCCFCbzUGr0d
         30Gu7H2deAtYctcMetsTRyJwQOa1Yov/8uOek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zm96awOTyQdBAQ39ZmbTLB2bJOaShzPfIo6BaQ8vXXU=;
        b=NR7FC+o491fmhpYfECyCY0Ysa47bEn2Z1rG3Wdb8WcY6/P7m9Edg75KhpWcrV7KdPM
         js/2I3asy3FHtGA49Fuql55iDKHqVXQ9s+rxqr4bKAuX2VlTg64y1q8UwNluKGOhnWFN
         YeCtfXrc8oAQbkTqFlZLfHkhGVIkCTZ3Mm0pvWW3H8kDiBLOltYmGPIq1WBjbMXGiI3L
         AfZ/FeorjOVJsKF/YMx9u0FSnIfZ5z1vDyBsWwPJo+Jx17ly6t9nLFSZECqfzwXyiICc
         yQ1/jkaRfdYv6OUGHFilQIlseLShW8gfvHBlaI1nYXCjamP5Ds2073DcC7nd/BkqBqQK
         zV/A==
X-Gm-Message-State: APjAAAWmAB32bHxUIHPFVxoBbw4bYsaLbpFeoeSUA3F1WtLSSJmvdx5d
        +GV8GH3jG/qSAUdLm2XQWvZnOg==
X-Google-Smtp-Source: APXvYqyxSUpPAHtvZrHSNZhCn+H2wdFJjxAmzyX2RWkM171Lmkf84wH/KAryObw8OT18cVPXu6GP3g==
X-Received: by 2002:a17:902:b702:: with SMTP id d2mr7285796pls.104.1573592293343;
        Tue, 12 Nov 2019 12:58:13 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k84sm6812454pfd.157.2019.11.12.12.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 12:58:12 -0800 (PST)
Date:   Tue, 12 Nov 2019 12:58:11 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jan Kara <jack@suse.cz>
Cc:     Theodore Ts'o <tytso@mit.edu>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: jbd_unlock_bh_journal_head(): Memory - corruptions
Message-ID: <201911121257.3074FDDD@keescook>
References: <201911111735.5CD206D@keescook>
 <20191112110921.GG1241@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112110921.GG1241@quack2.suse.cz>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 12, 2019 at 12:09:21PM +0100, Jan Kara wrote:
> Hello,
> 
> On Mon 11-11-19 17:35:18, coverity-bot wrote:
> > This is an experimental automated report about issues detected by Coverity
> > from a scan of next-20191108 as part of the linux-next weekly scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by recent commits:
> > 
> > c290ea01abb7 ("fs: Remove ext3 filesystem driver")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1487847:  Memory - corruptions  (ARRAY_VS_SINGLETON)
> > /include/linux/jbd2.h: 351 in jbd_unlock_bh_journal_head()
> > 345     {
> > 346     	bit_spin_lock(BH_JournalHead, &bh->b_state);
> > 347     }
> > 348
> > 349     static inline void jbd_unlock_bh_journal_head(struct buffer_head *bh)
> > 350     {
> > vvv     CID 1487847:  Memory - corruptions  (ARRAY_VS_SINGLETON)
> > vvv     Passing "&bh->b_state" to function "bit_spin_unlock" which uses it as an array. This might corrupt or misinterpret adjacent memory locations.
> > 351     	bit_spin_unlock(BH_JournalHead, &bh->b_state);
> > 352     }
> 
> This is obviously false positive. I guess coverity needs to learn about
> bit-spinlocks so that it doesn't generate false positive report about each
> usage?

Yeah, that's a pretty weird glitch on Coverity's part. I've taken a note
on this subset of warnings. Thanks for looking at it!

-- 
Kees Cook
