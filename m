Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39526125A58
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 05:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbfLSEqw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 23:46:52 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41908 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbfLSEqw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Dec 2019 23:46:52 -0500
Received: by mail-wr1-f68.google.com with SMTP id c9so4561249wrw.8;
        Wed, 18 Dec 2019 20:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RewqfyyXUZkV87uK4kzXKpumYayj1KfeiY2XdrXVvEk=;
        b=b2kXwGjF/KZC5BAJK9E3w3S4vTSW8QqbTmD28QRCHDLL6jJjM5W9g1pAx2tJqGqhRR
         i0DCFfZEOsPIGP2LFB0q8y6qo5i6+OH5O797VULZS7zQR2QSMMnHAnhUtMFgeSNJEkFu
         Mm6ZJsSy+oAO9LnFYbVyIDaY64+C5XCApp1Pqn+jf11v2EMM6CMkWIWqoGome5bX8pml
         lV9N84SDRP7/XgQP3ZaBxaDKkl9HYNwbeLEVm0P+JyVnGnXjj0R6rtTGk3gJ3S+CGOoR
         i52HLQEPX8Tqq82QniHc9BejR2N0pV94jMk3qnZt0wckij2a3r6y7g7TAdEChSWKzrHY
         MyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RewqfyyXUZkV87uK4kzXKpumYayj1KfeiY2XdrXVvEk=;
        b=bO0mgmjhaFjuF53oH1LhTtupvi4izfNRSIWvFNZdJD/6kYpx9G7klwDdODOnEJceRE
         5IMvqJ52TtczEeKQ8hycfDft/tL/SJmjpb4VdYBkIGJZ7nphpP53n8LJmj0sasVX3/Qz
         KY+bVNaGPd0TRUhm5f7AapWHvMhp8YUPsmWTQ94vQ14cx70Yq5FLn+OBHRIdvwnyYOm/
         vUa0ZLBoHWZQsuYKYmucWaZ/JtppZluUQhHwFJ0qR6ncnPa8lEKzkFtKusJW2Y4g2Vwo
         m3RVRKn8ls1HICepZx2038hvFS1XrkDMU2z2jfONnizpEd1wG2yPDNSYBsmT54O0feFa
         WQsA==
X-Gm-Message-State: APjAAAXo9g5QHvaopQ5iSFq3MQStQwcC4JDYWsKCbxNSjG5BlxdyjkE8
        S+brsjrbPwYhbX2IOJ8EqprFgPCQuJEpjvZKNBcAEQ==
X-Google-Smtp-Source: APXvYqyCxuxeVFw1b72FQxFm4sMDuoygQtpMel373KN75/FGpF7gKkbQCxJa2BmXRzAOoSqBKxXUIOnvzpMfdZHbfuU=
X-Received: by 2002:a5d:4692:: with SMTP id u18mr3557822wrq.206.1576730809795;
 Wed, 18 Dec 2019 20:46:49 -0800 (PST)
MIME-Version: 1.0
References: <20191219082557.16092126@canb.auug.org.au> <BYAPR12MB2806A8EBBB8B6F9AE29FBC00F1520@BYAPR12MB2806.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB2806A8EBBB8B6F9AE29FBC00F1520@BYAPR12MB2806.namprd12.prod.outlook.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 18 Dec 2019 23:46:38 -0500
Message-ID: <CADnq5_PTLEXHd3U8fkKVcckFjCDN_p3n9PoQWwLkzRODqDd71A@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the amdgpu tree
To:     "Chen, Guchun" <Guchun.Chen@amd.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Dec 18, 2019 at 8:22 PM Chen, Guchun <Guchun.Chen@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Hi Stephen,
>
> Sorry for the inconvenience. How I can fix this?
>

Already fixed.

Alex

> Regards,
> Guchun
>
> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Thursday, December 19, 2019 5:26 AM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Chen, Guchun <Guchun.Chen@amd.com>
> Subject: linux-next: Fixes tag needs some work in the amdgpu tree
>
> Hi all,
>
> In commit
>
>   caa01659028a ("drm/amdgpu: move umc offset to one new header file for Arcturus")
>
> Fixes tag
>
>   Fixes: 9686563c4c42 drm/amdgpu: Added RAS UMC error query support for Arcturus
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Did you mean
>
> Fixes: 4cf781c24c3b ("drm/amdgpu: Added RAS UMC error query support for Arcturus")
>
> Also, please keep all the tags together at the end of the commit message.
>
> --
> Cheers,
> Stephen Rothwell
