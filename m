Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48B51C25A6
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2019 19:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730874AbfI3RFl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Sep 2019 13:05:41 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40953 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfI3RFl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Sep 2019 13:05:41 -0400
Received: by mail-pg1-f193.google.com with SMTP id d26so2260983pgl.7
        for <linux-next@vger.kernel.org>; Mon, 30 Sep 2019 10:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BUrexygk2vGXvsl5YJxOGfsGzieunyZasdA5fI9SM6w=;
        b=ZGyb77FiTwnTWXlVmO1UiQSW0ZiExuIVHEesp1Kqqw95aVm6IP8ffis60DsXyjr4F9
         FACR5jiHoi3WWEgF8zqBoVf5A8DgOjiVde7GRQOY09eHpNTiwLMJrpWZyikngkQPmzDz
         iy4Yr7xYQc7MZSnmZtASgTmdv3X6QWyD9ljPkH9NecisPXKeAEXLu/TBXF1LhmFMOyYH
         tuWx0JFUuVEZiiKqYvKUuQFtNh0zkfafhfy1fTHgfOfGQ9mR8gwrENZO5xPTczgPk8+j
         dxMe8jWGmq1GkN88mR+SkEfuVKUqEJYRUnQRrEh9YKZhUvosvGP0rc1qJfSQaC+JhZan
         Yqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BUrexygk2vGXvsl5YJxOGfsGzieunyZasdA5fI9SM6w=;
        b=nlFDZr6SmRiW6+tQnkWB+gWtqObSRI5aWh+mXZb46GQFreZOD65FIT6arD3THNNqdf
         mJhuBh6Tzx0HT2xN4GULnnFezcDMrFVravzXx/E1kiE279Lb50mvg4J2UWw2GT24kDIg
         Laxpq+Ss0O335MmCSxMchHZfkNwbVgXCFFqfhb/6OGaqI7pSy/2Elu0FZI7GlqUkvx9B
         M81HIsVasMLEYA9JbXWBPJ54iP7oarghNb1EAEVzxcbeiisXYog60KiCtTdeIiAwyJM6
         GGq1TF5Uh+IqaRsHxKcETAfO+597I3qwsjdbbfM2rPLuuKkl9oGCAYzcBvtU/zkj4rdx
         IBrg==
X-Gm-Message-State: APjAAAVdi6w+1ozD4cukrM/RhihLtsn76TlI5DlB+SCp441UpUys2oYH
        UEiYer1WVTc2FNr7XAqUj8QnJ12s0OzN85DzLOrqng==
X-Google-Smtp-Source: APXvYqwoHcnhCHq064AK/3Y2BHmD9Jb5tMJJYu8lpI9yq0t8NW/i41VkAJ2jtVT/A9rCJDrlr0GjXhlJWL5CxoA7Lvg=
X-Received: by 2002:a17:90a:5d09:: with SMTP id s9mr218347pji.131.1569863140029;
 Mon, 30 Sep 2019 10:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <8b9795d2-a384-dec8-076c-5b9d5c524eba@linuxfoundation.org>
 <20190926150538.GS2036@sirena.org.uk> <e5af1cd1-be83-cf9e-c6c7-a5258d1b49a9@linuxfoundation.org>
In-Reply-To: <e5af1cd1-be83-cf9e-c6c7-a5258d1b49a9@linuxfoundation.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 30 Sep 2019 10:05:28 -0700
Message-ID: <CAFd5g44bbh8cd=kfwLR2eFf0FRuO0d5-Mszo7P0JRLbs7e8CQw@mail.gmail.com>
Subject: Re: Request to add linux-kselftest test branch
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 26, 2019 at 9:53 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 9/26/19 9:05 AM, Mark Brown wrote:
> > On Wed, Sep 25, 2019 at 01:30:15PM -0600, Shuah Khan wrote:
> >
> >> Please add the following linux-kselftest test branch to linux-next.
> >
> >> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=test
> >
> >> please let me know if you have questions.
> >
> > OK, I've added that now - I did actually merge it in by hand
> > yesterday too.  It looks like it's for kunit so I guess Brendan
> > should be in the CC list for any issues too?  Hopefully Stephen
> > will see these mails when he gets back but it's worth checking
> > and following up to make sure that he picks it up after he gets
> > back on the 30th.

Just following up since Mark suggested that it might be a good idea to
do so and it doesn't look like the linux-kselftest test branch is
currently in next-20190930.

Thanks!
