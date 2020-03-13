Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBDD318514E
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 22:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgCMVnK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 17:43:10 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:40633 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgCMVnK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2020 17:43:10 -0400
Received: by mail-vs1-f65.google.com with SMTP id c18so7221184vsq.7
        for <linux-next@vger.kernel.org>; Fri, 13 Mar 2020 14:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hackerdom.ru; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ylFj3zeTIZkFpwpBxoZ98U2goVEkQPraU3e8Q+0STys=;
        b=Z06ioZWXC9qUUMYFklSpMq4HebUP9H/56Nk8CjwMebDGvQI//jW95kLICwKWPVbRYZ
         N3a412jfCIbuFWlFtMP3YyOY8GbdjYIdi0FBYICkC7JUlgyiZtZ+jqFp1W7d3OAxlrIw
         JFSRJFQG5a7oMEKaaB952DdHgKGaGGAXwXkR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ylFj3zeTIZkFpwpBxoZ98U2goVEkQPraU3e8Q+0STys=;
        b=uYDgHaffZvQ2Yj4+hnC1jBdCMhdeEyGm47CQ2sk/oT4HGH/hGwtCJFfiXtGGcLavk5
         7crWH58QcIqlE01e/FOo4fTAeqY8FlvmZ8X6J35r8HfA5NmXgiN2NN275Gr/TmIYPDeB
         okLFIuMqxy4/1OkkwHIoaGZ3SiVTnTtUqlYk6yg1f5mrW26zJz6529TJ5MFK2he8Hv8s
         h+JoYXcPSPu5aHIkIzFpp6AnaI9eJqNCd9aptr8OOtF+eaSwMlPib+SEWbXVLLfL/j6x
         AgU0XqmyCgK0x/Bt31Z1xGw5ls7IfDgiPdEm7wNfHJv4VAK1ILB0Wbv8oZkSkMg8TEpz
         PCTQ==
X-Gm-Message-State: ANhLgQ1nKy9ytt8mMxj9eh4IrFNLYkCzV0Fqz54B07Pu/MsJfT5g0EaI
        gV9Rb1R5k4FVIuLmTPuVq70TYdRISkHyD4SUVJNUkA==
X-Google-Smtp-Source: ADFU+vs61bZAervmQ3vm6cH24IQ0ejqgD9VitKVaeya5atguiynC6c+jppIvMnwe9pEQLGJ3qWOpR44GGFrtziyG03Q=
X-Received: by 2002:a67:88c8:: with SMTP id k191mr10538682vsd.110.1584135789094;
 Fri, 13 Mar 2020 14:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200313205415.021b7875@canb.auug.org.au> <CAPomEdz6pVnD39iZHSEd3gwEhgP2g8B5vTvqBP7eEHEAvTvFMg@mail.gmail.com>
 <20200313.112105.352870193577036810.davem@davemloft.net>
In-Reply-To: <20200313.112105.352870193577036810.davem@davemloft.net>
From:   =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCR0LXRgNGB0LXQvdC10LI=?= 
        <bay@hackerdom.ru>
Date:   Sat, 14 Mar 2020 02:42:57 +0500
Message-ID: <CAPomEdweTzsy=jiokMKV_enE=EkDocXxV3BZTV3ocAy50zvRwg@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the net-next tree
To:     David Miller <davem@davemloft.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Networking <netdev@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Ok, done.

Best,
Alexander Bersenev

=D0=BF=D1=82, 13 =D0=BC=D0=B0=D1=80. 2020 =D0=B3. =D0=B2 23:21, David Mille=
r <davem@davemloft.net>:
>
>
> Please submit this formally, inline and not as an attachment, to netdev.
> Otherwise patchwork will not pick it up and it will thus not get tracked
> properly.
>
> Thank you.
