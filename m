Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCD93A07A1
	for <lists+linux-next@lfdr.de>; Wed,  9 Jun 2021 01:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbhFHXO4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 19:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbhFHXOz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 19:14:55 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC73C061574
        for <linux-next@vger.kernel.org>; Tue,  8 Jun 2021 16:12:47 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id v11so3049802ply.6
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 16:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kN5AJmNddY4Di3EaoWry0qrGfdeRw3akunPO3LlLtUU=;
        b=dhHLEaOVfuUVZUxM+xeM3jDgOM5Vrldn5HHYHptlKbftszGwpgWS4ebSHxH+RvHj6M
         nCZQqkMVugTJgmoSi5js3rStYCenclsN0ZeemRjlMdcJLyuwJ/8CQPn4MvdedLMRHMdh
         oKHw2e4Ry+uYQDTmjWnby375GRdALi4owp5Jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kN5AJmNddY4Di3EaoWry0qrGfdeRw3akunPO3LlLtUU=;
        b=fflpQsiajOVOkQZ19y/TAv63sI5bg3h++APTpyfeK8G2Td9TagLS2jYrjFHXZmugfX
         jfEdEwsYoGRus6InMAQ7bUKxjv4NrT+iDrfWs8V4vGpaA5Xg96JqdSwg8SdsCZGMz2/C
         xXjMbsFszxGJQHPqcZPdJETDcZ0PVNrgS/fUFpxOoXgsrpUJVI8ri9SvpXUlHONOcEmD
         9d6xAk8msF/v0ugpV02+enyQgQt+VIPRqsq3426Gw7jbKwB2MgrSryeagijAJEQVjFlG
         x/wZHWSNl49lukx772xNC7pLdw2mKpf89QSX7xC4dYrMLvTAD5IwSUVPjOM6q5NUqCw2
         67pw==
X-Gm-Message-State: AOAM533fomOj6jm443LSz/AT5AkC7jB1YsVQT6eF+P3rx3UVioxqsA/T
        hiKgVxxwlyvfJB+BsGdObt0V9Wp/sXTCfA==
X-Google-Smtp-Source: ABdhPJzg822x7E9/3+N7fhmgOPAqgX9Qgpga/uiCOnpV1++boMy4cc3vxpfZOPycH2iV6FQxzbM2Fw==
X-Received: by 2002:a17:902:8a98:b029:f9:36dc:37cd with SMTP id p24-20020a1709028a98b02900f936dc37cdmr2411117plo.68.1623193967529;
        Tue, 08 Jun 2021 16:12:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i8sm12288843pgt.58.2021.06.08.16.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 16:12:46 -0700 (PDT)
Date:   Tue, 8 Jun 2021 16:12:46 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Coverity: do_migrate_range(): Error handling issues
Message-ID: <202106081612.0C76BE7B@keescook>
References: <202106081105.B3E3DAE44@keescook>
 <CAHk-=wihqdYzXc4kd8CZAD2Kaf5Wy_q3Bz7fVsskG=MFBtw69A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wihqdYzXc4kd8CZAD2Kaf5Wy_q3Bz7fVsskG=MFBtw69A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 08, 2021 at 12:35:34PM -0700, Linus Torvalds wrote:
> But when I actually grep for it, I see 4 call-sites that don't check
> the return value, and 5 that do. So it's more like 55% of callers that
> do check.
> 
> Anyway, this is a false positive. You don't have to check the return
> value.  The main example of doing so is the page-out code in
> mm/vmscan.c, and it does so just to keep track of success/fail
> statistics.

Okay, cool; thanks for taking a closer look at it.

-- 
Kees Cook
