Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3DA43060C6
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 17:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343955AbhA0QPg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 11:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235280AbhA0QPD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 11:15:03 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F37CC061574;
        Wed, 27 Jan 2021 08:14:21 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id bx12so3097329edb.8;
        Wed, 27 Jan 2021 08:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q/F7qhsaEWYNZls9CpPS4XL24h8th/y21SH+eagSk4g=;
        b=H/VaVE2mnq9jVN6IjLQJ4aC93ueAElGs27vsEwTdSOPa8vAc+xm3dG83gwJ8+Ohkz1
         KbQvVXvmpa4k0BiTKHTVEhXwxq4SCRXufwBR6TR5J/1mtvOGz7OoSIsBGlATRD477CgX
         3hLgYf65M62aEom36rL8A7wRveCdJC2PvHNwWPAaET09BpC2YwhPuMfW2hWKQYZgoBIN
         JSTt3csuhad2Z4o32pN9w844SUEGHjefnuwD8qoqTy3vIgmttN3Ep51S6ZTCqwpCG/0B
         EM4snxm1dDdAqGkjPrk+pPoX8LrWN97F3xM5v6jsZbtw14VTuwgv40nLoad6CPybY+PQ
         ifww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q/F7qhsaEWYNZls9CpPS4XL24h8th/y21SH+eagSk4g=;
        b=iJPZr0RGzd5P8Zr8SZx3usbd5OBzt1ST/BCg3BZOleIE6u6kLy7tlPQHV3bLyH35Mn
         hQqrpo1yZR8QCkgUasU1dmqGThy9C/UMGruRc6SDOufU3rxUBL7XIx8BbS1jIgy3tTY6
         EErgaXb3giooz8y6MnNIN+bM73o4e3wQKADEGAbIBIlSz3shhmnqvw3V4RAACBJpQK9n
         AR+t7LWdUZHlbKiyA9sW7KwRzXi/XYRzWr2IKWctTkYe8+Hg7Z41vfrWiekGtqL9lM12
         FeLmwEpZhBKq+m3iDWwoAM7H43jSf1bibvJFstQwMHiUmTzVvkDDY2qPx5Zf4hekvP4e
         VIHA==
X-Gm-Message-State: AOAM531xlFANZ06rIz3KjwzAm8yI3LQsw0Q9HhpayhCyBdI+dus3pacy
        g+As4rZgVSY18KmwzohcCcL1s3+tmA==
X-Google-Smtp-Source: ABdhPJxrw5nf0THPC6JL++US6Tkbjf0rDq3RasHIvC472BaZMomGGAHwaehCIfekDJpK47W+KNObDw==
X-Received: by 2002:a50:9310:: with SMTP id m16mr9813101eda.94.1611764060181;
        Wed, 27 Jan 2021 08:14:20 -0800 (PST)
Received: from localhost.localdomain ([46.53.253.48])
        by smtp.gmail.com with ESMTPSA id j5sm1622172edl.42.2021.01.27.08.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 08:14:19 -0800 (PST)
Date:   Wed, 27 Jan 2021 19:14:17 +0300
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210127161417.GA1870@localhost.localdomain>
References: <20210127232118.668e1bb3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210127232118.668e1bb3@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 27, 2021 at 11:21:18PM +1100, Stephen Rothwell wrote:
> Caused by commit
> 
>   5567a1a4b1c3 ("ramfs: support O_TMPFILE")

Can this be merged or sent to Al, please? It's ancient patch.
