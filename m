Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8398C57A4AD
	for <lists+linux-next@lfdr.de>; Tue, 19 Jul 2022 19:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237540AbiGSRMB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Jul 2022 13:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiGSRMA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Jul 2022 13:12:00 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303FC3D5B2
        for <linux-next@vger.kernel.org>; Tue, 19 Jul 2022 10:11:56 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id i14so27676142yba.1
        for <linux-next@vger.kernel.org>; Tue, 19 Jul 2022 10:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i9cWtsNaADxiOtp8Z1ab41SdVNMY6iARUMpAO2YuQ4k=;
        b=cBltdFKR+a7IgWbfDJv5a54sSqg6m4h1Kf2ud6yMVxz4DVOaj6eYpthSHG9DRhlUq7
         vfRtob1hbfI7lO9ukY1xMfkDiz6iVId0vVx1DrGSHM5bE4pT/FL7t4W0/TUH9dJep5Wk
         20+MSvYt3J+v9ahRa33lmZSWMPXB0EZT+h6YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i9cWtsNaADxiOtp8Z1ab41SdVNMY6iARUMpAO2YuQ4k=;
        b=iS1maZl8W8xn8fV+UNwwq4hgZyuKGYnR2pmSIUztuI1m1T7D6tOVayDt/4dc9/Wtwf
         agfw8TEgLwJhf3rqZjCN3Nf0uQVaGDPewQv4y/8dPWuoYOlCuEdcUo7PBVxCzDKHO73+
         PeFsKEzNL+KmhaqoHhOWvsKm5JX1NZ3uFn/6bAp+YFwOeZV8YPHa/Y4rEScR2pUylg/q
         ZRp5ZhX1zd6qcvbqPoPs0JbNvCiJrvkJSQ3Ln/mLo/uCwgUaG65hF71Cjdn1A4AzmYDS
         i+txZoDq1WiJ/5qJOxPPiODj0vinzWDC3+PzpTtngAdi9X+Swz9l8UNiWd4eU4ud6Ym4
         pghA==
X-Gm-Message-State: AJIora9aHQgOXFKZnE5YxQAIzTjw85U0sGa6QKZeOhI0UPS/D/pVfx7T
        NLhbs+B8l+ZFMHt73VeO2CvcX0tHhnlndOUV/uAZ7w==
X-Google-Smtp-Source: AGRyM1tV4H0pvx6jCGVXpjfX3HEHe69QXE28jHkC4yOWHBxMtM3zcR6FWLJn4RF4eAipbUchHcN9zF67OpwINJ2IazI=
X-Received: by 2002:a25:3184:0:b0:670:8123:c0ef with SMTP id
 x126-20020a253184000000b006708123c0efmr3904842ybx.240.1658250715432; Tue, 19
 Jul 2022 10:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220718163158.42176b4e@canb.auug.org.au> <YtXF8TUZHNRUUyJh@kroah.com>
 <CACeCKafbgLmhLoYQiTTDkeeJ26HqFYBHXtcpwQkzOyO9LESEFw@mail.gmail.com>
 <YtZUJr4oIIALgdO+@kroah.com> <YtadE201j+dt5jJx@kroah.com>
In-Reply-To: <YtadE201j+dt5jJx@kroah.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Tue, 19 Jul 2022 10:11:44 -0700
Message-ID: <CACeCKae5aeK4wU_=+EXFnEHKsFbRnvxo14KtZgMAYw+zNpnKBg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the usb tree
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Benson Leung <bleung@google.com>,
        Guenter Roeck <groeck@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 19, 2022 at 5:30 AM Greg KH <greg@kroah.com> wrote:
> > > 3. Revert the entire cros-typec-switch (patches 3-9) series from
> > > usb-next and wait till after the merge window to apply it to
> > > chrome-platform directly.
> >
> > I think I'll just do #3 to resolve the issue.  I'll do it in a few
> > hours.
>
> Now all reverted from my tree.  Please send these changs through the
> platform tree after the next -rc1 is released so that you don't end up
> with build problems again.

Will do. Thank you for catching this and reverting the patches. Sorry
for the trouble.

BR,

-Prashant
