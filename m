Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0684015D3
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 06:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbhIFEtP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 00:49:15 -0400
Received: from ozlabs.org ([203.11.71.1]:56005 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236072AbhIFEtP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Sep 2021 00:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630903689;
        bh=AwFKaFJF4BLkecDe8KRlmjohip8z7vEH2CcinA3oC/Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ba9Ss+0QLLq/Rjhp9bZdUkl88PvT3Bv3xBFDeji4Gi5jPBJSt0k3Be8Opw8umUY9E
         biFUae4n6H+UDhSU4qnc9XOlRsuIJJxCQq18pz/zmrPUaNOSWglwwEU/2XTAvA2tCJ
         igDFkdW9jo45nIUNfvnrPpwZUQ13hDnhbOzhsvZhhKYD0T7StN5RUq/Dc3e2UaHOLf
         CF0BaOGfooevuzsZNDvPfkUx39ghe+khuZLbWW4pprEO94mz3WaugMfitqjMhyNF7F
         NoGQdW/wKppk6J8BFDIezxLyA0HBWdPKfZRkWLQRVpHEYbOB+6v+1ELJb4DxPubP/T
         t7IbE7hhqmx2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H2wrS4PCNz9sRN;
        Mon,  6 Sep 2021 14:48:08 +1000 (AEST)
Date:   Mon, 6 Sep 2021 14:48:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 folio tree
Message-ID: <20210906144807.4db0790f@canb.auug.org.au>
In-Reply-To: <20210721163118.3ca01b57@canb.auug.org.au>
References: <20210721163118.3ca01b57@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HF1p=+TbwbIJZIkq0YfH0hr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HF1p=+TbwbIJZIkq0YfH0hr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 21 Jul 2021 16:31:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the akpm-current tree got conflicts in:
>=20
>   include/linux/memcontrol.h
>   mm/memcontrol.c
>=20
> between commits:
>=20
>   05bb7bbab428 ("mm/memcg: Convert mem_cgroup_charge() to take a folio")
>   8b2afb6a1c34 ("mm/memcg: Convert mem_cgroup_uncharge() to take a folio")
>=20
> from the folio tree and commit:
>=20
>   1f4c6a1cf274 ("mm, memcg: inline mem_cgroup_{charge/uncharge} to improv=
e disabled memcg config")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/linux/memcontrol.h
> index af9c44bb1e42,406058a0c480..000000000000
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@@ -704,15 -691,37 +702,36 @@@ static inline bool mem_cgroup_below_min
>   		page_counter_read(&memcg->memory);
>   }
>  =20
> - int mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t =
gfp);
>  -int __mem_cgroup_charge(struct page *page, struct mm_struct *mm,
>  -			gfp_t gfp_mask);
>  -static inline int mem_cgroup_charge(struct page *page, struct mm_struct=
 *mm,
>  -				    gfp_t gfp_mask)
> ++int __mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_=
t gfp);
> ++static inline int mem_cgroup_charge(struct folio *folio, struct mm_stru=
ct *mm,
> ++				    gfp_t gfp)
> + {
> + 	if (mem_cgroup_disabled())
> + 		return 0;
>  -	return __mem_cgroup_charge(page, mm, gfp_mask);
> ++	return __mem_cgroup_charge(folio, mm, gfp);
> + }
> +=20
>   int mem_cgroup_swapin_charge_page(struct page *page, struct mm_struct *=
mm,
>   				  gfp_t gfp, swp_entry_t entry);
>   void mem_cgroup_swapin_uncharge_swap(swp_entry_t entry);
>  =20
> - void mem_cgroup_uncharge(struct folio *folio);
> - void mem_cgroup_uncharge_list(struct list_head *page_list);
>  -void __mem_cgroup_uncharge(struct page *page);
>  -static inline void mem_cgroup_uncharge(struct page *page)
> ++void __mem_cgroup_uncharge(struct folio *folio);
> ++static inline void mem_cgroup_uncharge(struct folio *folio)
> + {
> + 	if (mem_cgroup_disabled())
> + 		return;
>  -	__mem_cgroup_uncharge(page);
> ++	__mem_cgroup_uncharge(folio);
> + }
> +=20
> + void __mem_cgroup_uncharge_list(struct list_head *page_list);
> + static inline void mem_cgroup_uncharge_list(struct list_head *page_list)
> + {
> + 	if (mem_cgroup_disabled())
> + 		return;
> + 	__mem_cgroup_uncharge_list(page_list);
> + }
>  =20
>  -void mem_cgroup_migrate(struct page *oldpage, struct page *newpage);
>  +void mem_cgroup_migrate(struct folio *old, struct folio *new);
>  =20
>   /**
>    * mem_cgroup_lruvec - get the lru list vector for a memcg & node
> diff --cc mm/memcontrol.c
> index 1d77c873463c,c010164172dd..000000000000
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@@ -6712,29 -6718,27 +6708,26 @@@ out
>   }
>  =20
>   /**
> -  * mem_cgroup_charge - Charge a newly allocated folio to a cgroup.
>  - * __mem_cgroup_charge - charge a newly allocated page to a cgroup
>  - * @page: page to charge
>  - * @mm: mm context of the victim
>  - * @gfp_mask: reclaim mode
> ++ * __mem_cgroup_charge - Charge a newly allocated folio to a cgroup.
>  + * @folio: Folio to charge.
>  + * @mm: mm context of the allocating task.
>  + * @gfp: Reclaim mode.
>    *
>  - * Try to charge @page to the memcg that @mm belongs to, reclaiming
>  - * pages according to @gfp_mask if necessary. if @mm is NULL, try to
>  + * Try to charge @folio to the memcg that @mm belongs to, reclaiming
>  + * pages according to @gfp if necessary.  If @mm is NULL, try to
>    * charge to the active memcg.
>    *
>  - * Do not use this for pages allocated for swapin.
>  + * Do not use this for folios allocated for swapin.
>    *
>  - * Returns 0 on success. Otherwise, an error code is returned.
>  + * Return: 0 on success. Otherwise, an error code is returned.
>    */
> - int mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t =
gfp)
>  -int __mem_cgroup_charge(struct page *page, struct mm_struct *mm,
>  -			gfp_t gfp_mask)
> ++int __mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_=
t gfp)
>   {
>   	struct mem_cgroup *memcg;
>   	int ret;
>  =20
> - 	if (mem_cgroup_disabled())
> - 		return 0;
> -=20
>   	memcg =3D get_mem_cgroup_from_mm(mm);
>  -	ret =3D charge_memcg(page, memcg, gfp_mask);
>  +	ret =3D charge_memcg(folio, memcg, gfp);
>   	css_put(&memcg->css);
>  =20
>   	return ret;
> @@@ -6906,20 -6909,17 +6899,17 @@@ static void uncharge_folio(struct foli
>   }
>  =20
>   /**
> -  * mem_cgroup_uncharge - Uncharge a folio.
>  - * __mem_cgroup_uncharge - uncharge a page
>  - * @page: page to uncharge
> ++ * __mem_cgroup_uncharge - Uncharge a folio.
>  + * @folio: Folio to uncharge.
>    *
>  - * Uncharge a page previously charged with __mem_cgroup_charge().
>  + * Uncharge a folio previously charged with mem_cgroup_charge().
>    */
> - void mem_cgroup_uncharge(struct folio *folio)
>  -void __mem_cgroup_uncharge(struct page *page)
> ++void __mem_cgroup_uncharge(struct folio *folio)
>   {
>   	struct uncharge_gather ug;
>  =20
> - 	if (mem_cgroup_disabled())
> - 		return;
> -=20
>  -	/* Don't touch page->lru of any random page, pre-check: */
>  -	if (!page_memcg(page))
>  +	/* Don't touch folio->lru of any random page, pre-check: */
>  +	if (!folio_memcg(folio))
>   		return;
>  =20
>   	uncharge_gather_clear(&ug);
> @@@ -6932,19 -6932,16 +6922,16 @@@
>    * @page_list: list of pages to uncharge
>    *
>    * Uncharge a list of pages previously charged with
> -  * mem_cgroup_charge().
> +  * __mem_cgroup_charge().
>    */
> - void mem_cgroup_uncharge_list(struct list_head *page_list)
> + void __mem_cgroup_uncharge_list(struct list_head *page_list)
>   {
>   	struct uncharge_gather ug;
>  -	struct page *page;
>  +	struct folio *folio;
>  =20
> - 	if (mem_cgroup_disabled())
> - 		return;
> -=20
>   	uncharge_gather_clear(&ug);
>  -	list_for_each_entry(page, page_list, lru)
>  -		uncharge_page(page, &ug);
>  +	list_for_each_entry(folio, page_list, lru)
>  +		uncharge_folio(folio, &ug);
>   	if (ug.memcg)
>   		uncharge_batch(&ug);
>   }

This is now a conflict between the folio tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/HF1p=+TbwbIJZIkq0YfH0hr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE1nYcACgkQAVBC80lX
0Gw9ggf+I6IaKtdLcXbyzRMraFeJT5i0DscRfXkGOpi5L+cPBUraWc6YNp0UKrdp
q4B3SdSPBsS0yBMRQq5HksdshCSJrAsPPS3nWt2gDvexnigGuSJVhn6CJk9NnW11
+ADCyPXBJqsXAdevtjhz/uy3UdSDD5xy1JRQuY/iWC5KQvEAhzk+L2dopRP6pPcF
WsrhcXXZGz00o9bEVdxeMpEep5JPD8RqlxlCSDiShTrnQk+egNaEhe5UZ5laSDdl
vSrUwoKkMWhlaumk5dZuDlseMbTkW3jW47igmUHmzP8E8brlS90O4JnM9zLzxww1
SDnPXSb3BurK8NHiNvSG6l1/YwTU5w==
=V9Kr
-----END PGP SIGNATURE-----

--Sig_/HF1p=+TbwbIJZIkq0YfH0hr--
