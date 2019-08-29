Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 816D2A2A0D
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 00:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbfH2WqA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 18:46:00 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45282 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728579AbfH2Wp7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2019 18:45:59 -0400
Received: by mail-ot1-f67.google.com with SMTP id m24so5055643otp.12
        for <linux-next@vger.kernel.org>; Thu, 29 Aug 2019 15:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AIuig4xjj1okPm1v+nckMKBMxCFTk/w+YVlFEyiN+6I=;
        b=UYQHthzH50nn10Fq77yoEj2YvcrNXNY6o18RXam9bIfpl1wHeEULO4yuuCSRI/Ru2K
         RLreXb965cYq9f3IqoESXN6C24GqPvA0ZrmEimO02Cts4PIULu8eTSRXN1IJsCJpfuRT
         +BxwrrliSYijoXLFR2JXb4Dd9dixmo7nx0t/SCzsYhC6j9bvK86j3oNNTrtP+EVJSHkr
         99Pi3kPcsOf6m/wOqSI9Rwe2C2ZMhHPCJ4mFEsr7TfAmthneIydvqyFqOfcrDZTd1ej9
         rYDVYNrMO2OaS4qmIqAoNyXXvTyMb6cGBOK+FkHL6xZJdSGVe9V9M57hTVctnR+W3nW/
         RkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AIuig4xjj1okPm1v+nckMKBMxCFTk/w+YVlFEyiN+6I=;
        b=CAY13xUUW3xye0V5vxL0UfSXFJjqBPD5EKvz238L2bRMR1KiTRgm9Qk3qqhXFqgoff
         HtaPkOUtmwCgM9NQgiNfHCHWm4eWE9p3MP+WLDSloiqwc3cn1EV+3VjQ/jD1zu6/Nzr9
         0nxXFWvZMn5T1JLhlTcM+HWxkiIQaQDaWATNxnyXXOirEwRxYSEhjC81DUqtfmi5AELH
         HJWNf4NyivTgWcHa+E1lVqF2JdUwFE+52J62aQMZrhkTk+1ks3aK5Y5R4GLnL8us2Zo3
         bc5yUJwONAHMBb/t2xkM/9dwQf4OsBShnZY4yDfnrgkQMhcCULVYqLmzVoJ/R0/Td/pZ
         9xLw==
X-Gm-Message-State: APjAAAW+wHUfKXxy9FeeFIjgaSv8OWumuO5Yvn6NEwHfe9fw6zuhbo0A
        uuZml0CQjyGTIdjhHpakiUdUOfNnP9wRpsIWegLhjw==
X-Google-Smtp-Source: APXvYqy2RByDJRCk/msHyU5rudzz0l2j2S1qCHXaP4lkineatCLBMlR9sdECn9SSUKEhV7aUFLo14KwjqemHdp5tUtA=
X-Received: by 2002:a05:6830:1e05:: with SMTP id s5mr9281786otr.247.1567118758900;
 Thu, 29 Aug 2019 15:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190830080855.45421fa0@canb.auug.org.au>
In-Reply-To: <20190830080855.45421fa0@canb.auug.org.au>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 29 Aug 2019 15:45:48 -0700
Message-ID: <CAPcyv4iWUa-HVoODtbj-G2jxS0Tm-x_=s4PNQ-M-FvDibYFgFw@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the nvdimm-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jeff Moyer <jmoyer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 29, 2019 at 3:09 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   dcbce3cd20be ("libnvdimm/pfn: Fix namespace creation on misaligned addresses")
>
> Fixes tag
>
>   Fixes: commit a3619190d62e ("libnvdimm/pfn: stop padding pmem namespaces ...")
>
> has these problem(s):
>
>   - leading word 'commit' unexpected

"Fixes" fixed, thanks Stephen.
