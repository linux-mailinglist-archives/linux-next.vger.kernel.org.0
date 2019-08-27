Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C04C89E89F
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2019 15:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfH0NHW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Aug 2019 09:07:22 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39351 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729056AbfH0NHW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Aug 2019 09:07:22 -0400
Received: by mail-lj1-f196.google.com with SMTP id x4so18378563ljj.6;
        Tue, 27 Aug 2019 06:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pxkb58lbV3wi+B8lPOx80DhPe0KHCiwso2HrtND1Ksc=;
        b=scU2g9+aFUxV9jxgnAylnl5bOrE1INDe11xAppEI53j07saNKoiRgJW7H6ekJWLV9L
         yMgM55l0/3eT4wxM/UvUJ9WpFShvGrvdsGt0+sbXM3G0rrbcHPsJnRnZLDkRYZiVBGcQ
         UtFPz79tZaFbRNmv/eccwVyvILdI2a7n4PmLiuzeHKrh2db0xezOkF0deT1c5PlJU52Y
         QXdBnVKgazWN/94usms99FjwdUf2llOVAWY9RXK+kWJEGyw0Hc40h6Nhsdot/aGZDN4a
         ZjuWk0jYMLME04kkj6Nn9cK0X8wBGJTlMfrjwEjaDGoglOz9F2lAFBHCtaxOlTP24VY3
         E+QA==
X-Gm-Message-State: APjAAAU7+h3+jIReFJZoj22d/dBkAYQpHyqY5cvcpljsRgUL5LjxhPP5
        6F77TyBDbBIusLG8EHDywQp7ybj2xtB+DPicknBER5YV
X-Google-Smtp-Source: APXvYqyuDMNG0JuiRDkktslqdVFZfaP8JIaCO6DMKJkYpYhz0RvwBbBVLPsf/FkfvNVQBquyZwpFfClR/zyPFor5DoU=
X-Received: by 2002:a2e:9981:: with SMTP id w1mr13032457lji.155.1566911239777;
 Tue, 27 Aug 2019 06:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190814002836.4b6aa14b@canb.auug.org.au> <CAK8P3a2q1mShg-EQhiAFUOAET8UEMHfLJV-+HoLTaSQY+M7yBQ@mail.gmail.com>
 <20190814074730.402ec3ec@canb.auug.org.au> <f4e0e924-03ea-bf63-85a0-5718874ceb38@st.com>
In-Reply-To: <f4e0e924-03ea-bf63-85a0-5718874ceb38@st.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 27 Aug 2019 15:07:02 +0200
Message-ID: <CAK8P3a1M94LwpVhJe8eLG-JMr+wEuACZZ=_=N3ws5x9yP9SnLg@mail.gmail.com>
Subject: Re: linux-next: Fixes tags need some work in the arm-soc tree
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fabrice Gasnier <fabrice.gasnier@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 26, 2019 at 11:44 AM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
> On 8/13/19 11:47 PM, Stephen Rothwell wrote:
> > Hi Arnd,
> >
> > On Tue, 13 Aug 2019 21:35:58 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> On Tue, Aug 13, 2019 at 4:28 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >>>
> >>> Please do not split Fixes tags over more than one line.  Also, please
> >>> keep them with the rest of the other tags.
> >>
> >> Thanks for the report. How bad is this? Should I undo the merge and
> >> wait for an updated pull request?
> >
> > Its probably ok to leave as long as lessons are learnt :-)
> >
>
> Sorry for my late answer.
>
> Thanks Stephen for information. I'll take care next time before merging
> patches with "fixes" tag.
>
> Arnd, no need to update the PR ?

No, since it's already pulled, just leave it for this time.

    Arnd
