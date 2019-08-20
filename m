Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEE2896C7A
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 00:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730728AbfHTWjr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 18:39:47 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40013 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730638AbfHTWjq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Aug 2019 18:39:46 -0400
Received: by mail-io1-f66.google.com with SMTP id t6so668479ios.7
        for <linux-next@vger.kernel.org>; Tue, 20 Aug 2019 15:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MT+ivku//XHW9CQIQxnjOGps60BwXIMdgpVq4LcGGRo=;
        b=vHfwU3zqmy+0qJUig/HZgM51qpUxdBAYAwamUtIQ+OFUVNDNBoWKEiq12IjW0hyxDW
         VD3JP4v2raa071gQz1iVmWqbjttAJ1EmhD56cXwtlEytaa8uksUqp5gCeHV9YlmJkPNw
         8RtQfRTSbZ5CthQWbacG/2bI4OLBKdnfFt0C1wR0Z0PM8xwP7HNWcpWPnQR7iXhdJIEH
         jbHUcg0OfkZ+o3SZb/1pJ1HFk/zvzbOdBTKFOo+vHwZe8YC1YjDvAWEi3LcyVFSFkwgz
         smOeT/rUwr2UKUd9pTj/U0+82ZLCJNvBCmogxY2wIg5b5UwV7f3wn5SvcsHc0doSwVus
         FabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MT+ivku//XHW9CQIQxnjOGps60BwXIMdgpVq4LcGGRo=;
        b=mgEq+nW4SsiKZ05ldV9B2SJd2v/st+UvenLiXDoU4XLtElLT8mH7vNPpp0lh2TIb8P
         2a/CXvRxDSp4qUkW2lozgA2zMSe3hupPKCiIVonPjYGLBSa1/7w04J8Is8cWeO/BLQOx
         UsEJVf8v+iJYvb5Ks9MyBPVqZfZxnzf7aZTIUg+BSFru/iAh4J/u+CQ5YJK8crYeRxlb
         bwV7TTXl1M1We2C6ICS0LoMpzVzoBsavUFFuQNFz+GmmQsKsqDDK9/P71VNNQVTVgo8T
         YRv+LNfttJoGVJE06yQjI6agIyHzIz2NcaSnNrkCflU4hb283RuvHlF8Es5cm+HNlyVN
         9qbw==
X-Gm-Message-State: APjAAAWvHS+JQjSW86cwfZ/1+zZ5TIuUfQ51kUBS7JUsX0idMu4oet/l
        DuM5AOAROLvlogr2Gdf2e3hfxSAt2ug0GYXpmSFkyA==
X-Google-Smtp-Source: APXvYqzTp1KjLOqOkcr9JA80dhLVWKU/MMyi+QIgRT2TB1zTzY9il078ETGnH8HnwJIuJoSljRbgv4+1nanX149FHE4=
X-Received: by 2002:a5d:97d8:: with SMTP id k24mr11314289ios.84.1566340785548;
 Tue, 20 Aug 2019 15:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190821083227.794a0a83@canb.auug.org.au>
In-Reply-To: <20190821083227.794a0a83@canb.auug.org.au>
From:   Matthew Garrett <mjg59@google.com>
Date:   Tue, 20 Aug 2019 15:39:33 -0700
Message-ID: <CACdnJuvCQBX7JaajT5upiY-sNrUfS+pmmSqJF-g_mog96A8h1Q@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the security tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     James Morris <jmorris@namei.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 20, 2019 at 3:32 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   9d1f8be5cf42 ("bpf: Restrict bpf when kernel lockdown is in confidentiality mode")
>
> is missing a Signed-off-by from its author.

I'm providing this under category (c) of the DCO.
