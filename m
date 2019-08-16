Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2C0B8F89F
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 03:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfHPBwd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Aug 2019 21:52:33 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:55476 "EHLO
        mail-wm1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfHPBwd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Aug 2019 21:52:33 -0400
Received: by mail-wm1-f45.google.com with SMTP id f72so2783184wmf.5;
        Thu, 15 Aug 2019 18:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sdyaLFPxqbMGDypJodmJ89AtUfSMcXrORONL+MFpXP4=;
        b=WUDMjTzGVSCS4RpCU7aCyz6iBdsOU8pEHKTQo81jKlr+uoIWQWuy+39EY4u9oId1UR
         X3Gjri5xAJH+CVc0oMcrebZ1cjPu2VSird79Ji9jHmdD+s+aYu5ymuIIM13GxatFsIJV
         NbQwV0stmL38kYHJuAr8b80XRrYGDfP0csxRuKypT/xrfWtQdpD6xn67tvSkDS8ijnaS
         /FYMcgBwyMWscS11DHmSVnBLuW0iT/rnGlZ9YTX4EeFZC7cgyXVanEdbdfjO5Czv/stu
         cTKIOAD0u1Sb5zgORv+mHFPORmQMTEJ7bDM+o/Na7sQq8Pv0T+lduk+/1XWPz6ZUeNdS
         qzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sdyaLFPxqbMGDypJodmJ89AtUfSMcXrORONL+MFpXP4=;
        b=D8Ne8zTAaZRVnMU83vmiBDEnjLQ90t2qIgFhiBY4UCo1k9ky8KN60H5ztzUW3qmmtD
         cRzK78HxI/bJPPnpznBT9Imfit2/Hi1rusUxkojP9jI2Z+hLmdE5uOJJmjTeOzMPsfMx
         xQFN6wkSIScExc2on7QJpw50LjLxYYm4PaCzZS+Ll1cBxQ58JE0Kfkzw1j1biu06gIFY
         W7NuGycaX0XvRd0IdvwsNAnWCb14WWyMfrKBUggjZZHmoVJgKki5WG8E63NvpdNrGYbz
         8Q8XQS3hCfaUqs36JLbtlylkee4vxDFHy+JZnKobFtDcD2vvrOIJDuM9XhqBpxnlK6sA
         DuWg==
X-Gm-Message-State: APjAAAUkrchzqhrDL6+HT7LnFPa6JGRDR5jgKWIMfhD+3CjAzWU6Q/MS
        EMcRToQPrU3NAsmNPQiTh8LJRWn+2d7IaE0hg/BU3g==
X-Google-Smtp-Source: APXvYqw8CbmRsUZ+6G8rZhodvJrYsaPZsQVehRgVSidu3w0pDYxXyLyQ3AxssvNexselD79WSW3d0bpxs9zpsErSeCY=
X-Received: by 2002:a1c:c1cd:: with SMTP id r196mr5022264wmf.127.1565920351317;
 Thu, 15 Aug 2019 18:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190813181038.2c6aafb9@canb.auug.org.au> <MN2PR12MB3309141545B644DCA7F144B7ECD20@MN2PR12MB3309.namprd12.prod.outlook.com>
 <CADnq5_MA-9pT=cZJYCZ62VXjwNtxaCLH2kb5ig5TLFKx4wsmjA@mail.gmail.com> <20190816102139.701937c8@canb.auug.org.au>
In-Reply-To: <20190816102139.701937c8@canb.auug.org.au>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 15 Aug 2019 21:52:19 -0400
Message-ID: <CADnq5_PnhEHdpBKJEBr+kWoOtku1DMd=PYFzK1cJKFce8J7NPw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Huang, Ray" <Ray.Huang@amd.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Yes, sorry, just pushed out now.

Alex

On Thu, Aug 15, 2019 at 8:21 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Alex,
>
> On Tue, 13 Aug 2019 10:01:07 -0400 Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Applied.  thanks!
>
> But not pushed out?
>
> --
> Cheers,
> Stephen Rothwell
