Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5A27B6B89
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2019 21:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfIRTDj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Sep 2019 15:03:39 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37614 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfIRTDi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Sep 2019 15:03:38 -0400
Received: by mail-lf1-f66.google.com with SMTP id w67so474773lff.4
        for <linux-next@vger.kernel.org>; Wed, 18 Sep 2019 12:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FIxcmAv8Po+czY66H7vvvtaXyWmCwGyyWI4O3j01+mA=;
        b=EsmVEzq19JVOk1cxULtjZcJs4Iioe/J/ot0dhBe+67+Wr5xqdgNOOOV43ylIRXSwPW
         RWYcYMVP0sfHCohLpBDidM7I6SBijQg1LVQ/B/7pSoAc+t/JKz6Z5HSOR4oP8Q04+rwA
         ANqiISTCEEC4qcWcXT0n988u0ONPsMOZrgrd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FIxcmAv8Po+czY66H7vvvtaXyWmCwGyyWI4O3j01+mA=;
        b=IjaZuKpu5kMsDTT96a3Iw5MqycgO/SUtqsP1YjAS0icuvejdBDvoLahJTxWPaFTaDI
         AX0gF1433zgAocIxR82XDLsB/rCqLOEbZpDOrTK/7og5U8YhOwXsJSaovokSoimVuTEl
         YGz1UXeDPD+4MAHkopVhUASBKT8jolkt2aUIRd/QRT78pf+LFRDgyPCHYKzgIL6W+vHq
         b81jPEYq7zptTYs6dik5g4yguIj1WOeoENILdugHx2hZXNXKXqoI1gYm14leQJb29smV
         AfTXJeAI3M1bzBZz1p5SJ+bOMYeK7nXqTnGc0l6XvB6cjuzKGcMdqAGBvzLU2AODiWzp
         Qfew==
X-Gm-Message-State: APjAAAU91SCRJi6AwwCD+uXptAGSIijQJ1AE2012GObCKVLpThbg5pZv
        9qvAGXF01jezZAYSjuudIHEPWalwLeE=
X-Google-Smtp-Source: APXvYqzvTju3EoZJEeurkEMbh5sU8siXsQHSCWLGpn7J5dXPS3vkDCRvunOdUYpSTawxw7r+YN/j5w==
X-Received: by 2002:ac2:4551:: with SMTP id j17mr2862682lfm.81.1568833415216;
        Wed, 18 Sep 2019 12:03:35 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id d26sm1176405ljc.64.2019.09.18.12.03.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2019 12:03:35 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 7so1018010ljw.7
        for <linux-next@vger.kernel.org>; Wed, 18 Sep 2019 12:03:33 -0700 (PDT)
X-Received: by 2002:a2e:8943:: with SMTP id b3mr3094106ljk.165.1568833413723;
 Wed, 18 Sep 2019 12:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190918170952.GT2596@sirena.co.uk> <20190918185257.GC1933777@kroah.com>
In-Reply-To: <20190918185257.GC1933777@kroah.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 18 Sep 2019 12:03:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=whreYmsU_AQtzDS5gd3yamYJ72gBo+YekYSyJLPQ1Qo-A@mail.gmail.com>
Message-ID: <CAHk-=whreYmsU_AQtzDS5gd3yamYJ72gBo+YekYSyJLPQ1Qo-A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 18, 2019 at 11:53 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Sep 18, 2019 at 06:09:52PM +0100, Mark Brown wrote:
> >
> > After merging the driver-core tree, today's linux-next build
> > for arm64 allmodconfig failed like this:
>
> Wait, I thought Linus said this fixup was now resolved.  What went
> wrong?

I think this is purely a linux-next build failure.

I do full allmodconfig builds between each merge I do, and what
happened is that as part of the LED merge, I removed the
no-longer-used 'i2c_acpi_find_match_adapter()' to resolve that build
warning.

Then linux-next presumably merged my tree with the driver-core tree,
and that re-instated the use of i2c_acpi_find_match_adapter() - which
was now gone.

But when *I* merged the driver-core tree, I did the merge fixup
correctly to actually re-instate not only the use, but also re-instate
the removed function that now had a use again.

> Linus, should I submit a fix for this?

My tree should be fine, and I really think this is just a temporary
linux-next effect from the above. I think linux-next only handled the
actual syntactic conflicts, not the semantic conflict of "function had
been removed to avoid build error from previous merge, and needed to
be brought back"

Knock wood.

              Linus
