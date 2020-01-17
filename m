Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC4E14110D
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2020 19:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgAQSp6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jan 2020 13:45:58 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:46693 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbgAQSp6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jan 2020 13:45:58 -0500
Received: by mail-il1-f195.google.com with SMTP id t17so22052119ilm.13
        for <linux-next@vger.kernel.org>; Fri, 17 Jan 2020 10:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=420/qCDRks1KhueK56gSNAOoSvZ7SEAp1yLAyd/yyFM=;
        b=yCgP2tn8pQLxdsNWd/XN2QqX2CXdZFqGPPFyzspWIdPa9qUzOoE2kzJU1IE0tUdWjL
         4BXq38kFJEGC3fc597AP4qMsw2oTCVb8ODMgBngH5myjiGjB0NOgakVVrF8qkT1jXQCn
         lcO05570Ul45oz3t/HUGQpCHaUiWQZDkcmiWSn7H3n69c4jvAgrogYO2eMwdWaOVw7ly
         kSRJDVqj9ChZDf6ytvSZIzdeVpVR4iAZVONpFwOkRNCMuH4elY7iGxXBZMrL6nTdRyKB
         41MQk98RiEplwZ7uLSd6xiVgOh81zfAfG8v/8tKttjGBjQHuuobYT8OKSbu06Jjjy3ih
         8PYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=420/qCDRks1KhueK56gSNAOoSvZ7SEAp1yLAyd/yyFM=;
        b=A/QlMPpHcIA1g0IHfmVy9evHQYuDkVDS5goo1we4p9tfyy3NHmvR9ftgQSo/yvPU6n
         dK0PqtUeFpjt55Z7HKBP5aRQAXujDUxOiIYwci4BdVf0KaByYkSt99Cu77zBIuxqj+1a
         tH4lE0G4cqlNcULVBIcc2cb1hM8B/zbSiAWBGeW7kLfy2Y3YYMgamEuPvK8mroLZn4bR
         BcFo9cL7G1Q0OaZO+O0kcc6qDZASSmSrWLU3vNGYE5IiRTeCcEW+P3VDAjCjhpsv650D
         ChDiD15c7Ww61MISORzFdUF+TZWq7b8KGFvxLdkoACHjz1HUi9r6q2Kx+CrMVyP6Pnfu
         UN/Q==
X-Gm-Message-State: APjAAAWKGOUdwZKyC+1HW/lbvrFYzXAFftzfOpR9IpMqe3CeXDxsavgA
        tIXJvDzfypzU/mhZ/ttnwXRCmMpifdQTGC4YHo6ZvrDEbZE=
X-Google-Smtp-Source: APXvYqyD3T0zxOFN2wcBKJ8V0hfXKMNOlDpYBDr5FI3wwBYODV4MtVy/MotlaHesUUq+1J5hAlsR+yalSwQOTCFwfJk=
X-Received: by 2002:a92:5d03:: with SMTP id r3mr3908789ilb.278.1579286757291;
 Fri, 17 Jan 2020 10:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20200113065808.25f28c40@canb.auug.org.au> <CAOesGMifHn6DbNgYm6YUbdKjSL5rNgdWrq+HX9dEusrOr9xX2A@mail.gmail.com>
 <20200113113837.130c3936@canb.auug.org.au>
In-Reply-To: <20200113113837.130c3936@canb.auug.org.au>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 17 Jan 2020 10:45:46 -0800
Message-ID: <CAOesGMgiAp=xjpyvXSmuXL493Ki3DvWXf3N5uncP3s08_FpvuQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Ludovic Barre <ludovic.barre@st.com>,
        Yann Gautier <yann.gautier@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Sun, Jan 12, 2020 at 4:38 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Olof,
>
> On Sun, 12 Jan 2020 11:59:58 -0800 Olof Johansson <olof@lixom.net> wrote:
> >
> > Thanks for the report. Time to automate this at our end, we've had a
> > few too many of these slip through all the way to you lately.
> >
> > Where do you keep your scripts that you catch these things with? Do
> > you have a writeup of the checks you do? I should add it to my
> > automation once and for all.
>
> I should export my linux-next scripts as a git repo, but I haven't (yet) :-(
>
> Attached pleas find check_commits which I run after fetching each tree
> and pass the changed commit range.  This, in turn, runs check_fixes
> (also attached).

Thanks for sharing these. I'll add some slightly edited versions of
these to our soc-scripts repo and reference this thread and you as the
original author.


-Olof
