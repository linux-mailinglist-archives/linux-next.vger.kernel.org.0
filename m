Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44B1E130BE5
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 02:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbgAFBui (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jan 2020 20:50:38 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:40100 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbgAFBui (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Jan 2020 20:50:38 -0500
Received: by mail-io1-f67.google.com with SMTP id x1so47050700iop.7
        for <linux-next@vger.kernel.org>; Sun, 05 Jan 2020 17:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=VdfYfcG5q1NyFiFXYXaUTE1whOJmabFbb1jufVcSpNI=;
        b=eeXy++9VzngyMEB/0k4M6iH/GjyUpFOnbDJCiIkbbm6/RIwHHyVylyEQ2emB6Jmt0B
         Ey43n3ErHFXltbzX74bKzN7M0sKo02Op0k5a2+tkHbcxII03JSpVjmibmFpUYQZJMB+f
         MSEGLwh5GjnwtOnqRS3o66SUc3XP2VfXwd+iDuWduOukvK+uxnkQWdYc/amwy/RpB54n
         48jCh3KwpY3Vqc+vm8YwgTEk3Ijsr8sn5Lqs+ktIUgAmJmIl3XXVTVGw9o+0Na4lr0bZ
         OCwFdWhovdqIrX5I0j1XznJnXhpiqn5nX4aoMz8YKxptczjgO6AXnwrg6dAhD6zrbI7l
         YK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=VdfYfcG5q1NyFiFXYXaUTE1whOJmabFbb1jufVcSpNI=;
        b=W726s3r+sB9ako9wje/cBKiCqyFVaWcKmQARbCAPnLA/wCEqtAGnmtlr7iplEoQNqh
         4rcI8zeh12F606+KRT0s3kdQcJxadoJe8N7x1v85Rbj/SDTxiGKf3TzSX5qWq3gJcl5n
         4pBEefWvI0gJapN47Lk/tdY3frdg3xZZ5yvZ/9rgo3fQiP3c/5Ki424egiC5zFpcRejW
         VGcG7pjSfCoP0jfh0LgSTAReaHDngM3Qok2vmS7tLhzYP96e/34bAFYBDHzpIg/eg7M4
         kYJ9fjVXTtiB/ZfVwYN5OWlNXDso8UzSlDhNhAxtQMTJ0LoW1wEnLNOJr9GKv82dktmH
         qKnA==
X-Gm-Message-State: APjAAAWGqQLCfC6qM5V8QHx9BRNjG0UTjb/HgKsZmUkBBTjjdd4oShWs
        a0OTXF2ag2dxV1CnzWzj/DgpTA==
X-Google-Smtp-Source: APXvYqymJINXQwafxuveL/Fa0mW5ldqpklrKDw9WhQEWFERck5saRPT6P7hvfY9QBdWsOGkXLeRrnA==
X-Received: by 2002:a6b:c9c6:: with SMTP id z189mr64169930iof.285.1578275437348;
        Sun, 05 Jan 2020 17:50:37 -0800 (PST)
Received: from localhost ([64.62.168.194])
        by smtp.gmail.com with ESMTPSA id y18sm16204591ilm.9.2020.01.05.17.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 17:50:36 -0800 (PST)
Date:   Sun, 5 Jan 2020 17:50:35 -0800 (PST)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the risc-v tree with Linus' tree
In-Reply-To: <20200106093246.6abbb7e9@canb.auug.org.au>
Message-ID: <alpine.DEB.2.21.9999.2001051749560.484919@viisi.sifive.com>
References: <20200106093246.6abbb7e9@canb.auug.org.au>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, 6 Jan 2020, Stephen Rothwell wrote:

> Today's linux-next merge of the risc-v tree got a conflict in:
> 
>   Documentation/riscv/patch-acceptance.rst
> 
> between commit:
> 
>   0e194d9da198 ("Documentation: riscv: add patch acceptance guidelines")
> 
> from Linus' tree and commit:
> 
>   d89a1a16d7dc ("Documentation: riscv: add patch acceptance guidelines")
> 
> from the risc-v tree.
> 
> I fixed it up (I used the version from Linus' tree as that was committed
> later) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

Thanks, I just reset our for-next branch to v5.5-rc5, so this won't 
reappear.

- Paul
