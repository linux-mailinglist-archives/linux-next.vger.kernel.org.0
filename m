Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B341FFD07
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 23:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgFRVAs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Jun 2020 17:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbgFRVAq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Jun 2020 17:00:46 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FF24C06174E
        for <linux-next@vger.kernel.org>; Thu, 18 Jun 2020 14:00:46 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id bh7so2965282plb.11
        for <linux-next@vger.kernel.org>; Thu, 18 Jun 2020 14:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=eLnt/HJPru2ioN9LrlmerX/tWnXfT6zJTwacnuJbp/I=;
        b=NMM+gg6NFvyMDWF0fvM4JgtzVcqprjPeAXT/bqmOZXoU2JfC5LSvmiSo2xM+b0KBs0
         cmr4aMqP3ARYM+EOIoWOnfC1ZQCB8427lYm4zpIpqxyoQJNTD1wkFwSAbj1MclhyecFj
         zNwDSjC5aGFkj5fOq2vdGpBKHGAcBB9Jy6uOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=eLnt/HJPru2ioN9LrlmerX/tWnXfT6zJTwacnuJbp/I=;
        b=JcxVDidSHVzqrVlvEOcX8bK9Gd5Nltkz+xmIQx4DDkx1MsFj0fKXSQNnI0TYwIefhL
         2jf8ya/dJT28ooaqDUu8dCJOp780sCRhZqOlX0WBFjmgFo+6kvPJwiBwgMdJPAQ3+avy
         YEPcP6h6wUc33e7/l/3Rb1lIj7JFYkh5lFKRu5TpKbs7MAy74JVArBzvfAuUMpZHpDxb
         Jgw2bXsKcvmbdnLTm97dxqrbapDyt4WDo0Clu9ZrOqgZAZdcDclIPSTyaS62r6BgD6mn
         sJxltWrBmI4+xWRidP1T1Cb64kzZuSEIqLEBHmgd8stWFZfLz8BFhHD0S0SGRNjlCiiN
         sQ7A==
X-Gm-Message-State: AOAM532aje6N4bQyATmqfyuV9xVvt+hKI0QBYXWxajPg3iXeng+vC3Qi
        Yk6HL8UCvYCE90xZdqdLzBnHioBn7xw=
X-Google-Smtp-Source: ABdhPJzKu7RcfdYEnSmaoKvzl++90HL9QR1UvqpkQEYRRH2S5vhA2o4l3IjDX3AK/NAOqdsgxUQPxw==
X-Received: by 2002:a17:902:fe90:: with SMTP id x16mr5234873plm.290.1592514046175;
        Thu, 18 Jun 2020 14:00:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 85sm3698249pfz.145.2020.06.18.14.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 14:00:45 -0700 (PDT)
Date:   Thu, 18 Jun 2020 14:00:44 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: please add for-next/seccomp
Message-ID: <202006181357.5664DBCD4D@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Can you please add my "for-next/seccomp" tree to linux-next? I've been
including it in the already added "for-next/kspp" tree, but I'd rather
have it be its own tree for linux-next, as it is ultimately its own topic.

https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-next/seccomp

Thanks!

-Kees

-- 
Kees Cook
