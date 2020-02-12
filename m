Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93BE4159EE5
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2020 03:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbgBLCDX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Feb 2020 21:03:23 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:43273 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbgBLCDX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Feb 2020 21:03:23 -0500
Received: by mail-ed1-f68.google.com with SMTP id dc19so498250edb.10
        for <linux-next@vger.kernel.org>; Tue, 11 Feb 2020 18:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WxG+zr+JMbpL+J/BqXmHLkAnDUqnRpQxaRHMMaMCvhk=;
        b=Kl+w1xIxzOWNQJ67uo+mLQCTKz4K9IwnVx+eQOZIEpacfOFANQ2yJsxS+8vlof+eqp
         YMVm7hcqOnbcxnoyy8oCGNBIAgsnT43dC+Mlim+z0c/7K9AyaU7b6fzUfO1soHkUNpHs
         Pu5gwXcIwvxckBq2l3CfhJCcusKKX9Giw5KiRvBwfG43t6TKjd2x4sxug0Bs0EbftJYS
         cJWhsFFgiGWpKZCbY2AYIk06Eg+mkPw0/fve34WOz5P8xAKm2x67cA6aEB+sxQbp50Tm
         MyxwCe4QRuX77ZtT31yz4ZeLv2kuE+JMHYNs6XwUNbh0WUHDRJaQSJxi989GD3GbBgbg
         OZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WxG+zr+JMbpL+J/BqXmHLkAnDUqnRpQxaRHMMaMCvhk=;
        b=YQOiDA1PAC1dZ4gUpoRVgTLE60KaGNIFRqrM1HPc+ECARJNfd/7imrUVLQtiRtu4rc
         CNU+hTaRkh0S3EyLnKuFe9tTcebBakEZ/KkAzqHAurQiAhcRRyY92KIlIWOaDyV5cisk
         9CZ9U2dq0QYeQycnVVh5jiKCpn8yfaQD4cL6Vp/QyE7TPotX+gRd8foOwkKD+XtBlHob
         PJrwxFUJJ6U6TBZpIZBSg0+8oV8EGmKIu2ibBZdJStwh1YVaNXLBuL35UU9JoBzviLVw
         7YGNjg/lBinVFBhX19km4oW4MGacjMjUHIP1iHuq/BezvJmW1t+5XrJ5JCMJS8piS5F6
         jKag==
X-Gm-Message-State: APjAAAUq7P+h07c12uSdQxLqArs2cw19XrdKSej27f+Gw7yzEv1/TlY9
        pMJN3P3NGQ2cwqYipwOgkePq/Z3nr3RvskMvmmAr
X-Google-Smtp-Source: APXvYqxAgko6b1NA7NuuG4pF3CMzGeU7W3oL5CIqPG56hBdfkddgKZAnPWqX7iWqi2/DTRfRVueNRG9MH0Cs9xNe4CM=
X-Received: by 2002:a17:906:22cf:: with SMTP id q15mr8624116eja.77.1581473001158;
 Tue, 11 Feb 2020 18:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20200212103548.266f81fd@canb.auug.org.au>
In-Reply-To: <20200212103548.266f81fd@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 11 Feb 2020 21:03:10 -0500
Message-ID: <CAHC9VhQa1oXQ6duzUYrUq1NVdJKqo=wgorAgkHdGxTz_eNKeJQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the selinux tree with the keys tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Howells <dhowells@redhat.com>,
        Richard Haines <richard_c_haines@btinternet.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
        Stephen Smalley <sds@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 11, 2020 at 6:35 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the selinux tree got conflicts in:
>
>   security/selinux/include/security.h
>   security/selinux/ss/services.c
>
> between commit:
>
>   87b14da5b76a ("security/selinux: Add support for new key permissions")
>
> from the keys tree and commit:
>
>   7470d0d13fb6 ("selinux: allow kernfs symlinks to inherit parent directory context")
>
> from the selinux tree.

Thanks for bringing this up Stephen, I wasn't aware that patch had hit
the keys tree.

Unless I missed a message in the SELinux mailing list thread regarding
the "security/selinux: Add support for new key permissions" patch, I
thought there were some outstanding questions (well, just a single big
one I guess) that needed to be resolved before this could go upstream;
did you put this in the keys tree David just for some additional
testing, or because you wanted to send it up to Linus via your tree?

If the latter, I would really prefer if this goes to Linus via SELinux
tree as it conflicts with some SELinux ABI changes and I would rather
we handle that in the SELinux tree instead of having to send manual
merge instructions up to Linus during the next merge window.

-- 
paul moore
www.paul-moore.com
