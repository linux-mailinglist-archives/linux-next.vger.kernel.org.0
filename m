Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1A07188624
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 14:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgCQNqJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 09:46:09 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35079 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgCQNqJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Mar 2020 09:46:09 -0400
Received: by mail-pg1-f194.google.com with SMTP id 7so11785344pgr.2
        for <linux-next@vger.kernel.org>; Tue, 17 Mar 2020 06:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l5J45eIeJgWFUl2h4NYbnycSip/ojAAmeGMGD4sGnuw=;
        b=M4KKZLjNUID+vGh4gsHEtXBSH4/kqG1zW9Kw9JkuO79PzYyT8HDpKrRJMomhdKI7/6
         EGCoUpeGOeVFqbsdVgzutdxQlmiPz9Jgf2SOSS1p1F2Hj4+DMZkivKLMX9DRoTI/1WBc
         PYhqOrbYR0rlhJm4ELaNMHJzf6z3TTyqIfsPcrQESW0caRrUTffWdQdfKlvPKDYR4H5N
         l60V9KexBCszCHDss355vlLSUv6QhEd/S1GtfRkYoK9489direOYhJ8TYOImZg3Dqc0Q
         A7H26uwFJZr1YFKAY0UGa7sVXcyJcJ4LsOxvXb5TA2GwYhEfoAdHtodXm2pUBJUD+vIk
         kW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l5J45eIeJgWFUl2h4NYbnycSip/ojAAmeGMGD4sGnuw=;
        b=cv8KLtyapAoQaKGSEFf5vMim8LXy0udSOl3SyZe+4px1lVFr3lv4KLAmekXTkKX8sE
         mfDMM5aH3tLAh7jXCyRT4fMWkB6wMhMpgWUHGHJJhWyDN/SZiepjlgPOvV9jLZNTapQt
         1pNu9K793OdS7I+8b8YQaW58Wh3OuPzzJVzu/v66KlxMxT/r4MKxcf2wB/fWkUxV5WWk
         crB7ibnAoXBDCng4fI/MTVFomqlJsvidKJve2lImjKDWjZqxsV+EoY46HkXhEr47+Oj7
         0uMz+e6VZKFWn2rc28lXK9Ib9E5Xc0CZ2NIakwpC6e5QIW9moKD9uqNP39hpoXdEU/G1
         1z3g==
X-Gm-Message-State: ANhLgQ0P0BIp63VeHYOmTfr09fNqdO6n2nnZ7ZozctABdrar1PRyJgcr
        hJALEXaFFEbFLPWr7wRKRODujgpMuwmi+WQvONu2tQ==
X-Google-Smtp-Source: ADFU+vva8QSwFdcsMhSZjWQYHZKfwHAWNBDeutvy8/kYq4kZfBMbrTAsOL+QcUH9wTViNLO4LEYU1KBWFkjzUXRsNbg=
X-Received: by 2002:a63:2323:: with SMTP id j35mr5200321pgj.440.1584452767887;
 Tue, 17 Mar 2020 06:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200317185748.085ecf7f@canb.auug.org.au>
In-Reply-To: <20200317185748.085ecf7f@canb.auug.org.au>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 17 Mar 2020 14:45:56 +0100
Message-ID: <CAAeHK+zvcvxxxGKEhBm3t8rWoyMMEoGYJPpaW3-3sk4__PYJJg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the usb tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 17, 2020 at 8:57 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the usb tree, today's (actually yesterday's) linux-next
> build (powerpc allyesconfig) produced these warnings:
>
> ./usr/include/linux/usb/raw_gadget.h:74:12: warning: 'usb_raw_io_flags_zero' defined but not used [-Wunused-function]
>    74 | static int usb_raw_io_flags_zero(__u16 flags)
>       |            ^~~~~~~~~~~~~~~~~~~~~
> ./usr/include/linux/usb/raw_gadget.h:69:12: warning: 'usb_raw_io_flags_valid' defined but not used [-Wunused-function]
>    69 | static int usb_raw_io_flags_valid(__u16 flags)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
>
> Introduced by commit
>
>   f2c2e717642c ("usb: gadget: add raw-gadget interface")
>
> Missing "inline" n a header file?

Hi Stephen,

Yes, same issue as reported here:
https://github.com/ClangBuiltLinux/linux/issues/934

Thanks for the report!

Greg, should I send a new version with the fix right now, or is it OK
to wait until we get comments from Felipe/Alan and then send a new
version?
