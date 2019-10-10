Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E889D2B9E
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2019 15:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733125AbfJJNow (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Oct 2019 09:44:52 -0400
Received: from mail-ed1-f45.google.com ([209.85.208.45]:37825 "EHLO
        mail-ed1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387460AbfJJNoi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Oct 2019 09:44:38 -0400
Received: by mail-ed1-f45.google.com with SMTP id r4so5520680edy.4
        for <linux-next@vger.kernel.org>; Thu, 10 Oct 2019 06:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=hoJ6TorxaA0ueOkAnVcY7UKvB59REF8/krI4QbdE3rY=;
        b=AfuUb30BN2fwLHvc++JsHy0F39WOPWyY6n5BemTQw4OffXIs9XPV8OEKc91w7W4+g5
         hrlPzv1yXu60ZCX+CWlLe8CNYfo2zJTFzNtQS/MD5/GwzPcnvFN3neUhaveUI3Q8qoVC
         VH1RNyOOxQ0acee6EjhlHOvgQbsStXwga5L2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=hoJ6TorxaA0ueOkAnVcY7UKvB59REF8/krI4QbdE3rY=;
        b=R98P5QQr0z3xVVMUJCBjlip/GQHpDpnmLRw9HEFFN1AX01UQKwHDNWa41AtQvkpuA3
         TsgklcbAURSammqgHxKF+P2I4j+UgkBC/N23o/DIfdHVK40yirRK3h4qFGljxdltwwWS
         YCZrQ/Qvg/wqTDB6gXYf8jpTD/JKD+xM49k9f9OC4gVgrLxM/VLJOj4AXP5FSgDzAZzB
         X7qhqBpq4i1WFUmDcyhPKJtORUA4Li0KFpT5JbJXKJplYbIJW7RCXMIw2ha6e5EKSxSG
         fNrhevbBLQLgY+HQn3KLJhdCQmvgBJDJZb1jr4FNzFJwJw4y2WhhGeRgtqsCnCW2nFVi
         VH/Q==
X-Gm-Message-State: APjAAAXOSbPBlqtKqHeiFWMF2zdD2CFUL3fu2rDFENhGA6onX9dql2mo
        oj2fb2DB83xqdx6x3RiRcs0jDA==
X-Google-Smtp-Source: APXvYqzHiMfMRhzP+ce4ioVGwJmdp6neoxytw+JQPQJ8tg7kmLQo7v1y826ew96r7MuwZnWxO0ymAA==
X-Received: by 2002:a17:906:a986:: with SMTP id jr6mr7585993ejb.158.1570715076498;
        Thu, 10 Oct 2019 06:44:36 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id r18sm974451edx.94.2019.10.10.06.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 06:44:35 -0700 (PDT)
Date:   Thu, 10 Oct 2019 15:44:33 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Qian Cai <cai@lca.pw>, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20191010134433.GY16989@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Qian Cai <cai@lca.pw>, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>
References: <20191010131448.482da2b2@canb.auug.org.au>
 <20191010080207.GA22099@gmail.com>
 <20191010222210.1365d50b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010222210.1365d50b@canb.auug.org.au>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 10, 2019 at 10:23:21PM +1100, Stephen Rothwell wrote:
> Hi Ingo,
> 
> On Thu, 10 Oct 2019 10:02:07 +0200 Ingo Molnar <mingo@kernel.org> wrote:
> >
> > I suspect -next will have to carry this semantic merge conflict 
> > resolution until the DRM tree is merged upstream.
> 
> Yep, its not a real problem, I get a few like this every cycle.

Yeah totally within expectations when I acked that cleanup patch. We'll
probably have a few more lockdep annotation patches/changes that will
conflict in drm.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
