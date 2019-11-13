Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA0DFB7C8
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2019 19:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727538AbfKMSiq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Nov 2019 13:38:46 -0500
Received: from mail-pf1-f174.google.com ([209.85.210.174]:43389 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbfKMSiq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Nov 2019 13:38:46 -0500
Received: by mail-pf1-f174.google.com with SMTP id 3so2211443pfb.10
        for <linux-next@vger.kernel.org>; Wed, 13 Nov 2019 10:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fVMRIBORAVk9tYde2NMDtGaGqljZv65g5/hww5EiKjQ=;
        b=ONjfKbExld/CWE5muymvgoCRIvMn6y54pa8rLST6h5iD1s8XRzHod8k0Yxhe4dALTm
         vn98xj1E/gDCgGlKPI+Z+0MuDO7W+stNfHHbVyQy7zpldxKlaCqT1niDhExqZ5iabxL8
         V2GvMitfFmlhXEC5pLkc2TJsbULJkfXnyLD9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fVMRIBORAVk9tYde2NMDtGaGqljZv65g5/hww5EiKjQ=;
        b=FiX6pAJXGSCCJHFgboE6iiw2bf06FgxfRSOcc6ijsSmdwJ5Yannlq75uoBPrWmPZdz
         cqYWpAS8N0kLZqwSqfJUt7HkOan84yY6rn0Is2/dITXrvwzFuqbST6RF6WG7TXjVT9zT
         c0ftstN9taaS3vJiur7CejymDvwYakI5Wqi1CoYYsK7Yk5t6/AcElZdiACjes2JYRKvX
         DgssfgxOWT8dDns3smbY1iYk87LWdINIJ1bp96Kfum/P/rTK5cloclw/K0cAa2OWQK9Q
         n3obZrIQrpADZMSQ5rkF3BVl6xi9wpu/YpuPOzk01APO1QTVHnO6ONKl+nQE+pqxzC7K
         qVFw==
X-Gm-Message-State: APjAAAWAJ68NKH323yKZ5+N3XM2ydfisi/mtksY5g4Xo5ME91rMe6Qg7
        3EFvBkYiU3Z12eymOjx/noCtkRlBipw=
X-Google-Smtp-Source: APXvYqxRTuTK65WXIuOUB2QRR7AZUOOPEG3xZgaYIUevWbcCNn8Fky+FEEeBO0mz6WG89AQB7Loy4A==
X-Received: by 2002:a17:90a:9f8d:: with SMTP id o13mr7036356pjp.88.1573670325653;
        Wed, 13 Nov 2019 10:38:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q11sm3161774pgq.71.2019.11.13.10.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 10:38:44 -0800 (PST)
Date:   Wed, 13 Nov 2019 10:38:43 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jan Kara <jack@suse.cz>
Cc:     Matthew Bobrowski <mbobrowski@mbobrowski.org>,
        Theodore Ts'o <tytso@mit.edu>,
        Ritesh Harjani <riteshh@linux.ibm.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: ext4_iomap_alloc(): Integer handling issues
Message-ID: <201911131036.2E3F280B9@keescook>
References: <201911111735.1F45BB0B4@keescook>
 <20191112072239.GB15488@bobrowski>
 <20191112110004.GF1241@quack2.suse.cz>
 <201911121256.647DA73508@keescook>
 <20191112212846.GA29863@bobrowski>
 <201911121414.ECAA926@keescook>
 <20191113093754.GB6367@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113093754.GB6367@quack2.suse.cz>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 13, 2019 at 10:37:54AM +0100, Jan Kara wrote:
> Well, I don't think we want to clutter various places in the code with
> checks that inode->i_blkbits (which is what blkbits actually is) is what we
> expect. inode->i_blkbits is initialized in fs/inode.c:inode_init_always()
> from sb->s_blocksize_bits and never changed. sb->s_blocksize_bits gets set
> through sb_set_blocksize().  Now it would make sense to assert in
> sb_set_blocksize() that block size is in the range we expect it (currently
> there's just a comment there). But then I suspect that Coverity won't be
> able to carry over the limits as far as into ext4_iomap_alloc() code...
> Kees?

Yeah, I'm not sure it's capabilities in this regard. It's still a bit of a
black box. :) I just tend to lean toward adding asserts to code-document
value range expectations. Perhaps add the check in sb_set_blocksize()
just because it's a decent thing to test, and if Coverity doesn't notice,
that's okay -- my goal is to improve the kernel which may not always
reduce the static checker noise. :)

-- 
Kees Cook
