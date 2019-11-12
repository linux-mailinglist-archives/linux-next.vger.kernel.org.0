Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8036FF9C47
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 22:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfKLV24 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 16:28:56 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36320 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfKLV2z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 16:28:55 -0500
Received: by mail-pf1-f195.google.com with SMTP id b19so5991pfd.3
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 13:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aSw77mVGZI9DXcMAIn3uMEqYt6jLXcCoUOZHIZvOGPU=;
        b=WR/bRgJxpclFTZZj90snv6kO4R5PhN7vhsF9gs44KBK1VFlG6UZOB3Hy3G6kqFU474
         bG/mMrZuYewJTp0+KqlV27xDDF34G6cPj3XBUCeTF0O5Sm7t+dRiYa7Yq3XasvxXjVDD
         43goKrLY120DBOWvex1yvG2GYgRXNbRXxr2mllZUZ/vLTTGBMOm2ufCcHyiMV0quVfOB
         JWRxapSXG3w5J4ur9iwU+GZJWqK7Ya2IPvVi0eB0aKTtT/gcyX55LbbVwtWzTX33zDTU
         jCGtjVDDo4mMwkm1GQhtmIeZzwspy7ZjNJWshZSXYJVYZd47bKZFYOM1FLE70i7bkcHE
         bCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aSw77mVGZI9DXcMAIn3uMEqYt6jLXcCoUOZHIZvOGPU=;
        b=Db+1acMfRCoHmld6bGPne+UUPMyYoBuLGK3E2PH5eeGd72dH2bzoVkK8n2+JQMbuo9
         94esQM2iKZ/VjeWW2zMa35Ex/7MoDHIS1jupcmTrWWUHVSIhYNpLg1K71ZtvBn+/8xmp
         FMaR/dkeiBvq0BdfJETXWEtrmzD0ujJgDIvkqUDTvnCaopANZXIZZSw2mDvo57JAavZz
         7CA3JYv0k9H+eVqmHGGSCLUyjRfjSAGB7EnB0cJlvoXxFh5IpAZh1Mto/GDP1qYYgVBn
         qW8XtazEXloGjnPbqxE9TPRSsfffj14RCS1gSNbsio2fcAOojMJmd7k98tToLPcpHHpx
         V1OQ==
X-Gm-Message-State: APjAAAWmCyenWuBaeYQ3iHxpOcEaXsMNPGlq6OJKanHrloJXUpg/4cQJ
        0BJirHpvJLbOmW2Tzb5oC4oV
X-Google-Smtp-Source: APXvYqwuVBmS5vlHgyQbtZhZWQGNzDVse8V6yLZ35GUNfjBGAUGAUx2Djeyn/DfhO+6Ec2dNOc4IQQ==
X-Received: by 2002:a65:4305:: with SMTP id j5mr384563pgq.297.1573594134772;
        Tue, 12 Nov 2019 13:28:54 -0800 (PST)
Received: from bobrowski ([110.232.114.101])
        by smtp.gmail.com with ESMTPSA id s24sm20127093pfm.144.2019.11.12.13.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 13:28:54 -0800 (PST)
Date:   Wed, 13 Nov 2019 08:28:47 +1100
From:   Matthew Bobrowski <mbobrowski@mbobrowski.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Jan Kara <jack@suse.cz>, Theodore Ts'o <tytso@mit.edu>,
        Ritesh Harjani <riteshh@linux.ibm.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: ext4_iomap_alloc(): Integer handling issues
Message-ID: <20191112212846.GA29863@bobrowski>
References: <201911111735.1F45BB0B4@keescook>
 <20191112072239.GB15488@bobrowski>
 <20191112110004.GF1241@quack2.suse.cz>
 <201911121256.647DA73508@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911121256.647DA73508@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 12, 2019 at 12:56:45PM -0800, Kees Cook wrote:
> On Tue, Nov 12, 2019 at 12:00:04PM +0100, Jan Kara wrote:
> > On Tue 12-11-19 18:22:41, Matthew Bobrowski wrote:
> > > On Mon, Nov 11, 2019 at 05:35:44PM -0800, coverity-bot wrote:
> > > > This is an experimental automated report about issues detected by Coverity
> > > > from a scan of next-20191108 as part of the linux-next weekly scan project:
> > > > https://scan.coverity.com/projects/linux-next-weekly-scan
> > > > 
> > > > You're getting this email because you were associated with the identified
> > > > lines of code (noted below) that were touched by recent commits:
> > > > 
> > > > 378f32bab371 ("ext4: introduce direct I/O write using iomap infrastructure")
> > > > 
> > > > Coverity reported the following:
> > > > 
> > > > *** CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> > > > /fs/ext4/inode.c: 3388 in ext4_iomap_alloc()
> > > > 3382     	/*
> > > > 3383     	 * We use i_size instead of i_disksize here because delalloc writeback
> > > > 3384     	 * can complete at any point during the I/O and subsequently push the
> > > > 3385     	 * i_disksize out to i_size. This could be beyond where direct I/O is
> > > > 3386     	 * happening and thus expose allocated blocks to direct I/O reads.
> > > > 3387     	 */
> > > > vvv     CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> > > > vvv     Potentially overflowing expression "1 << blkbits" with type "int" (32 bits, signed) is evaluated using 32-bit arithmetic, and then used in a context that expects an expression of type "loff_t" (64 bits, signed).
> > > > 3388     	else if ((map->m_lblk * (1 << blkbits)) >= i_size_read(inode))
> > > > 3389     		m_flags = EXT4_GET_BLOCKS_CREATE;
> > > > 3390     	else if (ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))
> > > > 3391     		m_flags = EXT4_GET_BLOCKS_IO_CREATE_EXT;
> > > 
> > > In the event of an overflow in this specific context, I don't think it
> > > would matter too much to be perfectly honest. If 'blkbits' were to
> > > actually ever push out the signed integer to a value that couldn't be
> > > represented by this data type, I would expect the resulting wrapping
> > > behaviour to _only_ affect how filesystem blocks are allocated. In
> > > that case, I/O workloads would behave alot differently, and at that
> > > point I would hope that our filesystem related testing infrastructure
> > > would pick this up before allowing anything to leak out into the
> > > wild...
> > > 
> > > Unless my trail of thought is wrong? Happy to be corrected here and
> > > educated on this.
> > 
> > Fully agreed. blkbits is never expected to be larger than 16 in this code.
> > So this is false positive.
> 
> Thanks for looking into this!

No problem!
 
> Is it worth changing the type to u8 or something?

'blkbits' in this case is already of data type u8, so this would
effectively be a no-op. :)

/M
