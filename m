Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61442139EDB
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2020 02:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729335AbgANBWZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 20:22:25 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38309 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729334AbgANBWZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jan 2020 20:22:25 -0500
Received: by mail-pf1-f193.google.com with SMTP id x185so5750845pfc.5;
        Mon, 13 Jan 2020 17:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oISwi8GU+7YIyrOrSfp4ImJj1Y/DvBujca93dXgVtlA=;
        b=pmmufy/ruG8Yk3G13Kk0n9FsWP+7iMJUHICK7QN050PdDEd4giLRkBn68WZcc2EV+0
         9U7cu7H2gOwIcWuz/79yklnSATdq/nwpUeOhBZuKqNWFH3Y7bN/S/DaPqwj/IX4go2vU
         ULzTZmdp8fgsjcKdy0sRQHww2xsUpeu7kLfrbupH29QNXVlHScgUXEN9nvX2qp+7BfY6
         fqwZVvdTyHBmLXcMxgHL7RKlq4o8F/wRJi9RNnUAkcExc0SI5RQouFkeidFaBeWNxo41
         hdBO+d8W5OKRdl8bJ8XKN+6XZtuxc5XmU/PcGfgyLHHQa7nmjB9kaz8aBpU1/MVjykN5
         r0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oISwi8GU+7YIyrOrSfp4ImJj1Y/DvBujca93dXgVtlA=;
        b=e9o3EiEMlyD+dq5LVUxaFznKK3HdaPwyybyyBkdeNk43qxA+fzgV3OwvMFgjdT+F0k
         OVAQdACdyj4/Ixlp3cIItkGrImbRMQk3FnHfeXFqF2tCS5hEhHmxS45YXoN/6udzkIwe
         Ujz7ThuXf3uRzemef7MIM0kCngUBa1Q9Xc5QOUDuRjRffx8WSUD5O1Cw4jgeSceRUHJH
         xyoLNGSjvSZ4E/bF8+muUcrYgwuAzx4H5DSLpAigB9BtYRtBL5iZecGmlI//nhcPyOsf
         viyB7gAyY4Mm0fSfuwdmq02aKB3aIPKNiRkKIPHQvLhKJ8xijTjJSOluA/La/NOVPJ6q
         Qn4g==
X-Gm-Message-State: APjAAAXJBQCGbFqyMDbIfByVV5q+HjXXt1nIo0U24yT+R4xPq2Vl/xr6
        asFSWmQE1O60TJqJa4hCG7o=
X-Google-Smtp-Source: APXvYqxWg2ne000PwbmOdByZWSA7GR4T3UfyDJ0wmkkVI3T+MK4h1azrhhO9WUaiajXlX7hD2ww7Tg==
X-Received: by 2002:a63:7705:: with SMTP id s5mr23498344pgc.379.1578964944815;
        Mon, 13 Jan 2020 17:22:24 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
        by smtp.gmail.com with ESMTPSA id fa21sm14526963pjb.17.2020.01.13.17.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 17:22:23 -0800 (PST)
Date:   Tue, 14 Jan 2020 10:22:21 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qian Cai <cai@lca.pw>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the random tree
Message-ID: <20200114012221.GC202391@google.com>
References: <20200108113953.1a92a90f@canb.auug.org.au>
 <20200114001832.GP76141@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114001832.GP76141@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (20/01/13 19:18), Theodore Y. Ts'o wrote:
> On Wed, Jan 08, 2020 at 11:39:53AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commit
> > 
> >   1b710b1b10ef ("char/random: silence a lockdep splat with printk()")
> > 
> > is missing a Signed-off-by from its author.
> 
> Sergey, can you confirm that you intended to add a Signed-off-by: for
> this patch?

Oh, I didn't realize I was the author. Sorry!

Sure, confirmed

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>

	-ss
