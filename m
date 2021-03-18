Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAFC03408A6
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 16:20:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCRPTf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 11:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231817AbhCRPTQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 11:19:16 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C6FC06174A
        for <linux-next@vger.kernel.org>; Thu, 18 Mar 2021 08:19:16 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id x184so3703620pfd.6
        for <linux-next@vger.kernel.org>; Thu, 18 Mar 2021 08:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oITgoXxpG5IFQiSuGEG9li+gHRdH6qAeIXuRpqbED8Y=;
        b=F4EtKELjCeASgfM17bp+JK2YKQJ7UGHDTBeA8+k7cvOUF1ZN5oigShcJ6gbMb26xIh
         adpkB1cQ4PjejEwzAD0wC4dfmwKpqGjukJlkZ8yR0CHAi1h06rFCSRVTLnIR7f8lhQ4e
         Bq3MdZBiXEvbjquMGKN2q/AFzOU3Ne2nnPyhKZDvPeOTAgdUBuECTnMk7WQpu1iRc3ey
         lilwyPWnMdBr4C3sZUcAMTuqK+byqUC1BBID5r3b2JBQ7P4ISedygeBf9EiQKlA/qFTk
         SR5P3e6sxB/EIOADCAjVDUfuO2ELeeNsxw8KGoHQ8coID2R3lth4vL2klM+EeX9STmar
         exbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=oITgoXxpG5IFQiSuGEG9li+gHRdH6qAeIXuRpqbED8Y=;
        b=Q6zeXgdENt7ju0JpS5i6pDP/ryh5kdgDkyMftyhUn+x+T6ud88sTNkJnaBYYfMIH4t
         ix1+LrFlxqaJQOrUVKjZJ2PL/f0tDi/RH3j93vFLLAK1YrsbUXQIW8xNHfm5bRy25PH0
         6KJ4nVS3xQneqH5QEmidHXbOEvG1v3XHMAAsbhjcysT7U12YYtJMwYnXmECmVZ9fX3r1
         fNJX2R1UkJibwTBIdBoKTxt09pQqkiOPM1nkuxusag6oW5wWUsmi4msZF+udmTOfKy7d
         8YAPbHbBNRwuuOLPZg7tbyVRRNmXWXqP5BpFptQ2kZ3Sff6uiB1PE+k+ADA1pRwsdlDf
         aRKw==
X-Gm-Message-State: AOAM533Vf5CPZqOq7W66mxxXSzIknEukMadS48SFrJOsX0OyQFuBQi0K
        EeVSdc5SGcOnohM70XphR9Q=
X-Google-Smtp-Source: ABdhPJyUg3X2xdHrNtDPQET4TUpCL2kukEqniDVVyhg+JcCloTkmWyj8a8zJ7D/OPL8/y3bRXP6Kjg==
X-Received: by 2002:a63:207:: with SMTP id 7mr7283644pgc.346.1616080755926;
        Thu, 18 Mar 2021 08:19:15 -0700 (PDT)
Received: from google.com ([2620:15c:211:201:913d:5573:c956:f033])
        by smtp.gmail.com with ESMTPSA id m21sm2816641pff.61.2021.03.18.08.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 08:19:14 -0700 (PDT)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Thu, 18 Mar 2021 08:19:12 -0700
From:   Minchan Kim <minchan@kernel.org>
To:     Shakeel Butt <shakeelb@google.com>
Cc:     Heiko Carstens <hca@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Hugh Dickins <hughd@google.com>,
        Juergen Christ <jchrist@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [BUG -next] "memcg: charge before adding to swapcache on swapin"
 broken
Message-ID: <YFNvcEDfMUmDi/Fp@google.com>
References: <YFFRcPUtddlIB21l@osiris>
 <CALvZod5k5wgE-d=U=thhQp5bwQ6t0ugKDtZj75qSSYVB27uCuQ@mail.gmail.com>
 <YFIfjPzLzeJKs3hE@osiris>
 <CALvZod6GxjppjNuX5BQD+2WwWsdOcDqbKmCy6XGJyBsT_p2SxA@mail.gmail.com>
 <YFJqJeMDc/JCjfSv@osiris>
 <YFJwZoUalBM/lBBr@osiris>
 <CALvZod6EEyqyQD_AvcyTfxj+f0M+X1D1b50HWdaqL1qX69iaMQ@mail.gmail.com>
 <CALvZod5QjGy+WDOX=2mLB4ZgaRLk4kSu3y8ge+YqfHDacF2kKQ@mail.gmail.com>
 <YFKtTWk3eAsyqssD@google.com>
 <CALvZod7ggc=98wJauDmB=05+9MnLo0_ppeTHfZrxj5idNsD1iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvZod7ggc=98wJauDmB=05+9MnLo0_ppeTHfZrxj5idNsD1iA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 17, 2021 at 06:49:27PM -0700, Shakeel Butt wrote:
> On Wed, Mar 17, 2021 at 6:31 PM Minchan Kim <minchan@kernel.org> wrote:
> >
> [...]
> > >
> > > The simplest solution I can think of is to do set_page_private(page,
> > > entry.val) before swap_readpage(page, true) and set_page_private(page,
> > > 0) after.
> >
> > Since I did't read the bug in detail, I couldn't come up with how the
> > missing reset is connected the problem while missing set_page_private
> > with entry.val is clear.
> 
> This particular bug is about missing set_page_private(page,
> entry.val). I was wondering if we should always reset page->private or
> just leave it as is? I think it is safer to reset.

For safeness point of view, I couldn't find something wrong since
page_private will be used once the page turns out PageSwapCache.
(please chime in if someone found)

Having said, I agree it would be more consistent and safer.
