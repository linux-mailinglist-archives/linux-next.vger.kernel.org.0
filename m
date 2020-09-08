Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A94260F20
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 11:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728828AbgIHJ7d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 05:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728886AbgIHJ7a (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 05:59:30 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D90C061573;
        Tue,  8 Sep 2020 02:59:28 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id s2so7765049pjr.4;
        Tue, 08 Sep 2020 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PQg9eVQV0B9Lm6jeMoc6uXGoshaI/xJEXEEmohkfSoM=;
        b=rgN9WNfsDxisbDvGyY8i6+CQHQlG5FF22yiWG6ndBt1M6Mh6OCBKxEV2ppnLczz5Hc
         Rzaxv0wZgpKb4Duvwkmx18+xADlczn5HKJz6Qa5JhGHdKb9h2DlPMDqyVTY6BmlnIEcj
         jjD3eWa1eyY7B8iuArm1I8LZxpP714HssoNr+DpTGlEwMagBKy0pxnfIcAQq9XoHDQlE
         k3UlfxmN2EYYSB/4c/1nAxfPZ9Iqdlz59HFlOGm8ZnrdhbpeggeWW9UzZ25qM5kifHjS
         jYsfHKxEhGqjUho7T5p2wx8ORCKQ6mcXyO4jjGxQCxCQRjVk2cU+yf4JJ6T5rwK7C6gU
         ECkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PQg9eVQV0B9Lm6jeMoc6uXGoshaI/xJEXEEmohkfSoM=;
        b=Zv0nugOcjyNn4R6iXdZOt+2xFCui3ou2tNfXlH/xBf3fZV3j2bOLwuYk6hGaP6PzQ8
         liqvZBpxn9+H98FOgwjC73xb478q2dQSNk/+Lj00xapvNIR8OlSIRsWMnrrekW4NI0gL
         OVYspEzEdOTD9WenFlOWp+f1zw01bv1KkybSOlkarEUNjeQ06/8zPpyWlW8eHb38eRWt
         642HtOZXxIBiqfPrdsBPj9j/jXi3bHNgIRQ1dQe7S0LmmRal5U2EVrxUjqRyazUTAG+W
         v0oGGm9Kq+PGlFDuqT7uOY70PJrWl39v/5gL6O1ewextea/hdyOzu3cAtKykAtMnsP0i
         57Ow==
X-Gm-Message-State: AOAM5327lDqQqmJWakt/S0IwVwLZiHRltmb9SlikZV6zTJmzxPEG7he4
        hzBup7Id+YHHn/Em3g9dLhh2Yw4q5C4=
X-Google-Smtp-Source: ABdhPJypY1ZWkw/zpjg++SXqQq35X+DjtyhCd2pmzg+3p/NykE1cvX3rDLapKctnBGWOzLmL24GQRA==
X-Received: by 2002:a17:90b:4a47:: with SMTP id lb7mr3243837pjb.196.1599559168036;
        Tue, 08 Sep 2020 02:59:28 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id gn24sm1700897pjb.8.2020.09.08.02.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 02:59:26 -0700 (PDT)
Date:   Tue, 8 Sep 2020 18:59:24 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the printk tree
Message-ID: <20200908095924.GA74028@jagdpanzerIV.localdomain>
References: <20200905121827.22fb4037@canb.auug.org.au>
 <20200908074601.GA3864@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908074601.GA3864@alley>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (20/09/08 09:46), Petr Mladek wrote:
> On Sat 2020-09-05 12:18:27, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commit
> > 
> >   4c31ead75f41 ("printk: ringbuffer: support dataless records")
> > 
> > is missing a Signed-off-by from its committer.
> 
> Thanks for catching this. It should be fixed now.
> 
> It has been originally committed by Sergey. I rebased it to add the
> missing SHA1[0] and suddenly became committer, see

Oh.
I missed it somehow that b4/git-am didn't add all the required fields.
That wasn't the only patch that I applied. So, well.. Sorry and thanks
for catching and fixing this up.

	-ss
