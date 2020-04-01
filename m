Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28F7019A70F
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 10:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729358AbgDAITu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 04:19:50 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44194 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgDAITt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 04:19:49 -0400
Received: by mail-lj1-f196.google.com with SMTP id p14so24806258lji.11
        for <linux-next@vger.kernel.org>; Wed, 01 Apr 2020 01:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mIF2sw8MbXchkPoDVzAgUmxa+aiittUAn6fk84R4bVU=;
        b=hyYhjFz5pvJkCFsukALtuudolp+CuyATl5yvXAICDZGpVAl9VIjhIgDdC6o9D9UvyM
         RzS0B91qEoHpGSCVa3s3b6WQ7yrkwnZ7KKNds7J+qvMfMGi+Jb9ZwiQ18OvSHLiO81kB
         VzJ1BuR48clo5OcFEy5TajcF88cjozr6rFK5ENPEUkPhFoDpvbvSC3D3lvTWZpvSdCe7
         1ZiuyVuMF4cBUQB0WHaz9fGjmyqFwTydm4eO7OWbY+6/tQOHnYvF14Tx/QlBIRa81lhp
         aN5OxoTkdL8q+56CrXPszC9BecU3VxiBreb31qeDyWJM+CX9UbR1ApbdlWzm7AmdewDw
         dxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mIF2sw8MbXchkPoDVzAgUmxa+aiittUAn6fk84R4bVU=;
        b=BXgpB+lnzqGolefBB3RqQxdPShtOBgbrAqHQIPGcfEbvhZlK71OUTiPeXuqZ8lpffG
         w/TeYNs9ptsvZ8rh8V5lKM0/cFnOfjic7fgboPCHV+Kll3ahQAASDBnQymDFmm84nifY
         Z1VqOzPL9Sb3A5PTtZz1NpuGWkefkZyxJgRxLfzWfY0d2N2W2fU2nIpeIrHg/kKj1nm0
         zq9AhHlXEbywdAJS0ko1TBa/ftjIeZxmz3IFrykstDE0LwB1e5C9Rlezt24nxAD8jn4x
         HZ313YJMeOkZXdjF9oNQHyAYcw9EeT2pYi1d5PHc6uWnajPiOXcCgZbfEk4JrDodoYSI
         SvEQ==
X-Gm-Message-State: AGi0PuaBilOjdmqidpuU79EZqgUISVlqgcclqObj1KCfWAX3UpLDCFyg
        2gvRIDFsRyovz/AjDHFrXMiGnSnWdR8FRadDirNiVeLc8zg=
X-Google-Smtp-Source: APiQypJaZ7pJ0PA0qD/U/Bus/fhNXfVe8twCFP9intjOR98Q3Ir5o2KVftwuOvWKnZAVhs3KAWevTf53y4RxCtSNUsk=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr12032411ljh.258.1585729187241;
 Wed, 01 Apr 2020 01:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200401151904.6948af20@canb.auug.org.au>
In-Reply-To: <20200401151904.6948af20@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 1 Apr 2020 10:19:36 +0200
Message-ID: <CACRpkdaLByWiDCtgz3Z6Tr1sahEEyAfWvnM8Uqx+ygpjGwmLhg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 1, 2020 at 6:19 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 1 Apr 2020 15:14:32 +1100
> Subject: [PATCH] gpio: export of_pinctrl_get to modules
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

As noted by Geert I simply applied this to quickly repair
the build. Thanks a lot Stephen!

Yours,
Linus Walleij
